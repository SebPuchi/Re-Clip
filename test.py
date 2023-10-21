from diffusers import AutoPipelineForText2Image
import torch
import os


pipeline = AutoPipelineForText2Image.from_pretrained(
	"stabilityai/stable-diffusion-xl-base-1.0", torch_dtype=torch.float32
).to()

image = pipeline(
	prompt="Human like robots playing soccer against each other on a soccer field, action, detailed, photo", 
	negative_prompt="low quality, bad quality, bad anatomy", 
	guidance_scale=7.5,
	height=780,
	width=360,
).images[0]

image.save("robotSDXL.png")
