import json
import os
from forms import TextToSpeechForm
from flask_bootstrap import Bootstrap
from google.cloud import texttospeech
from flask import Flask, request, render_template, flash, redirect, send_file, url_for

# Imports the Google Cloud client library
from google.cloud import logging

# Instantiates a client
logging_client = logging.Client()

# The name of the log to write to
log_name = "Translation message"
# Selects the log to write to
logger = logging_client.logger(log_name)

# Writes the log entry



# Use app for GCP
app = Flask(__name__)
bootstrap = Bootstrap(app)
app.config['SECRET_KEY'] = 'bendeghe-ekiem'

@app.route('/', methods=['GET', 'POST'])
def home():
    """
    Route to display home page and form to receive text from user for speech synthesis.
    """
    form = TextToSpeechForm()

    # Instantiates a client
    client = texttospeech.TextToSpeechClient()

    # Get the language list
    voices = client.list_voices()
    voice_codes_list = list(dict.fromkeys([voice.language_codes[0] for voice in voices.voices]))
    language_list = [(ind + 1, voice) for ind, voice in enumerate(voice_codes_list)]

    if request.method == 'POST':
        lang = dict(language_list).get(int(form.language_options.data))
        gender = dict([(1, texttospeech.SsmlVoiceGender.MALE),
                       (2, texttospeech.SsmlVoiceGender.FEMALE)]).get(int(form.gender_options.data))
        messages = json.dumps({'text': form.text_field.data,
                               'language': lang,
                               'gender': gender})
        return redirect(url_for('.translate', messages=messages))
    return render_template('main.html', form=form)


@app.route('/translate')
def translate():
    """
    Route to synthesize speech using Google Text-to-Speech API.
    """

    # Get requested text
    messages = json.loads(request.args['messages'])

    # Instantiates a client
    client = texttospeech.TextToSpeechClient()

    # Set the text input to be synthesized
    synthesis_input = texttospeech.SynthesisInput(text=messages['text'])


    logger.log_text(messages['text'])
    # Build the voice request, select the language code ("en-US") and the ssml
    # voice gender ("neutral")
    voice = texttospeech.VoiceSelectionParams(
        language_code=messages['language'],
        ssml_gender=messages['gender'])

    # Select the type of audio file you want returned
    audio_config = texttospeech.AudioConfig(
        audio_encoding=texttospeech.AudioEncoding.MP3)

    # Perform the text-to-speech request on the text input with the selected
    # voice parameters and audio file type
    response = client.synthesize_speech(input=synthesis_input, voice=voice, audio_config=audio_config)

    # The response's audio_content is binary.
    with open('./static/output.mp3', 'wb') as out:
        # Write the response to the output file.
        out.write(response.audio_content)
        print('Audio content written to file "output.mp3"')

    return send_file('./static/output.mp3', attachment_filename='output.mp3')


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))