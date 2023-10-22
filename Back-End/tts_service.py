from google.cloud import texttospeech

def save_tts_audio(text, filename):
    client = texttospeech.TextToSpeechClient()
    synthesis_input = texttospeech.SynthesisInput(text=text)
    voice = texttospeech.VoiceSelectionParams(language_code="en-US", ssml_gender=texttospeech.SsmlVoiceGender.MALE, name="en-US-Neural2-J")
    audio_config = texttospeech.AudioConfig(audio_encoding=texttospeech.AudioEncoding.MP3, speaking_rate=1.25)
    response = client.synthesize_speech(input=synthesis_input, voice=voice, audio_config=audio_config)

    with open(filename, "wb") as out:
        out.write(response.audio_content)
    
    return len(response.audio_content)


# print(save_tts_audio("""
# Hey, team! Let's talk about this research wrap-up. 'Feeling ethics' in design is a bit of a tangled mess, mixing with beliefs, cultures, conflicts, and social stuff, just like regular design [22]. The authors, and maybe all soma designers, seem pretty alike in values, but there's work to do in handling conflicts using 'felt ethics.' They're sure ethical and moral ideas will clash – no fence-sitting here – and not everyone will agree on what's right. They're figuring out how to mix personal views with lots of different perspectives in the future. Their 'felt ethics' is rooted in soma design, but other designers might have different tricks up their sleeves. They're cool with different ideas and challenges. Theory in Human-Computer Interaction (HCI), they say, is about inspiring and helping designers choose, not bossing them around. They're inviting designers to weigh in on their 'felt ethics,' sparking a chat about ethics in HCI. Oh, and a friendly reminder: be mindful of how you practice ethics daily in this tech world where one size doesn't fit all. So, designers, jump in, share your thoughts, and let's keep the conversation buzzing in the world of Human-Computer Interaction!
# """, "speech3.mp3"))


def parse_srt_file(file_path):
    chunks = []
    with open(file_path, 'r') as file:
        lines = file.readlines()
        
        # Initialize variables to store the current chunk and timestamp
        current_chunk = ""
        current_timestamp = ""
        
        # Iterate through lines in the file
        for line in lines:
            line = line.strip()
            
            # Check if the line is empty (indicating the end of a chunk)
            if not line:
                # Append the current chunk to the list
                chunks.append(current_chunk)
                # Reset current chunk and timestamp
                current_chunk = ""
                current_timestamp = ""
            else:
                # Check if the line is a timestamp or part of the text
                if '-->' in line:
                    # Save the timestamp
                    current_timestamp = line
                else:
                    # Append the text to the current chunk
                    current_chunk += line + ' '

    return [chunk[2:] for chunk in chunks]


srt_file = 'rp-3-robots.txt'

chunks = parse_srt_file(srt_file)

for i, c in enumerate(chunks):
    print("Saving chunk", i)
    print(c)
    save_tts_audio(c, f"{srt_file}_chunk_{i}.mp3")

print("DONE")
