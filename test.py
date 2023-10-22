from diffusers import AutoPipelineForText2Image
import torch
import os


pipeline = AutoPipelineForText2Image.from_pretrained(
	"kandinsky-community/kandinsky-2-2-decoder", torch_dtype=torch.float32
).to()

image = pipeline(
	prompt="In this image, a designer is depicted at their work desk, carefully crafting a digital interface. The background shows a rapidly changing technological landscape. The designer appears deep in thought, reflecting the authors' call for mindfulness in practicing ethical sensibilities in day-to-day design work, reaslistic, detailed, 8k", 
	negative_prompt="low quality, bad quality, neon colors, bad anatomy", 
	guidance_scale=7.5,
	height=768,
	width=360,
).images[0]

image.save("designer.png")