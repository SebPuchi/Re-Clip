from moviepy.config import change_settings
change_settings({"IMAGEMAGICK_BINARY": r"C:\\Program Files\\ImageMagick-7.1.1-Q16-HDRI\\magick.exe"})

from moviepy.editor import *
import os

def create_and_render_video(audio_file_name, chunk_text, i, clip_file_name): 
    clip = ImageClip(clip_file_name)
    clip.fps = 24 

    audio = AudioFileClip(audio_file_name)

    new_audio = CompositeAudioClip([audio])
    clip.set_duration(new_audio.duration)
    clip.audio = new_audio

    chunk_text = '\n'.join([chunk_text[i:i+50] for i in range(0, len(chunk_text), 50)])

    output_video_file = f"{directory}_{i}.mp4"

    print ("Output file name: ",output_video_file)


    # Add Subtitle Text
    txt_clip = TextClip(f"{chunk_text}", fontsize = 20, color = 'white', bg_color = 'black')  
    
    # setting position of text in the center and duration will be 10 seconds  
    txt_clip = txt_clip.set_position("bottom").margin(bottom=200).set_duration(new_audio.duration)
    
    # Overlay the text clip on the first video clip  
    video = CompositeVideoClip([clip, txt_clip]).set_duration(new_audio.duration)

    # Write output video file
    video.write_videofile(output_video_file, 
        codec='libx264', 
        audio_codec='aac', 
        temp_audiofile='temp-audio.m4a', 
        remove_temp=True
    )

    return video

clip_arr = []
txt_arr = []

# Directory Structure
directory = "GH1"
directory_audio = f"{directory}/Audio"
text_file = f"{directory}/Text/subtitles.txt"
directory_fig = f"{directory}/Fig"

with open(text_file, "r") as file:
    # Read the entire content of the file and split it into an array of strings
    txt_arr = file.read().splitlines()
    print(txt_arr)


# List all MP3 files in the directory_audio
mp3_files = [file for file in os.listdir(directory_audio) if file.endswith(".mp3")]

# Iterate through the MP3 files and print filename and index
for i, mp3_file in enumerate(mp3_files, start=0):
    print(f"File {i}: {mp3_file}")
    video = create_and_render_video(f"{directory_audio}/{mp3_file}", txt_arr[i], i, f"{directory_fig}/{directory}_{i}.png")
    clip_arr.append(video)

final = concatenate_videoclips(clip_arr)
final.write_videofile("final.mp4", 
        codec='libx264', 
        audio_codec='aac', 
        temp_audiofile='temp-audio.m4a', 
        remove_temp=True
    )
