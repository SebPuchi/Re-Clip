from diffusers import AutoPipelineForText2Image
import torch
import os

# Local Send
'''
Sure, here are five image descriptions related to the video script:

1. Image: A smartphone and a laptop connected over a local network, with the LocalSend app displayed on their screens. The devices symbolize secure local communication, emphasizing "No internet? No problem!" as stated in the script.

2. Image: A visual representation of LocalSend's cross-platform compatibility, featuring icons of various operating systems (Windows, macOS, Linux, Android, and iOS) connected by a network cable. The absence of external servers highlights the app's pure local connection.

3. Image: A split-screen display showing screenshots of secure communication in action on both an iPhone and a PC, underlining the reliability and compatibility of LocalSend across different devices.

4. Image: A montage of app store icons for different platforms (Windows Store, App Store, Google Play, etc.), showcasing the ease of downloading and automatic updates for LocalSend.

5. Image: A padlock and a shield symbolizing security, with the LocalSend logo integrated into the design. This image conveys the app's commitment to security through REST API, HTTPS, and dynamic TLS/SSL certificates, as mentioned in the video script.
'''

# Tensor LT
'''
Image: A futuristic digital landscape with a prominent "TensorRT-LLM" logo, showcasing the concept of embarking on a journey into the future of language models. The imagery emphasizes the cutting-edge nature of the toolbox.

Image: A visual representation of NVIDIA GPUs interconnected with pipelines and parallelism arrows, symbolizing the power of Tensor Parallelism and Pipeline Parallelism. This image highlights high-performance inference with TensorRT-LLM on GPUs.

Image: A computer screen displaying code in Python, accompanied by icons of LLM models like BERT and GPT. This conveys the idea of effortless model creation and customization using the Python API, inspired by PyTorch.

Image: A matrix displaying different numerical precisions (FP32, FP16, INT8, and INT4) alongside a graph showing rigorous testing on NVIDIA GPUs. This image illustrates the precision and performance of TensorRT-LLM.

Image: An illustration of a toolbox transforming into a powerful engine with gears, cogs, and advanced features like Multi-head Attention and In-flight Batching. This imagery represents the versatility and capabilities of TensorRT-LLM, emphasizing its role as a powerhouse.
'''

# Local Send
local_send_images = [
    "A smartphone and a laptop connected over a local network with the LocalSend app displayed on their screens. The devices symbolize secure local communication emphasizing 'No internet? No problem!' as stated in the script.",
    "A visual representation of LocalSend's cross-platform compatibility featuring icons of various operating systems (Windows, macOS, Linux, Android, and iOS) connected by a network cable. The absence of external servers highlights the app's pure local connection.",
    "A split-screen display showing screenshots of secure communication in action on both an iPhone and a PC underlining the reliability and compatibility of LocalSend across different devices.",
    "A montage of app store icons for different platforms (Windows Store, App Store, Google Play, etc.) showcasing the ease of downloading and automatic updates for LocalSend.",
    "A padlock and a shield symbolizing security with the LocalSend logo integrated into the design. This image conveys the app's commitment to security through REST API, HTTPS, and dynamic TLS/SSL certificates as mentioned in the video script."
]

# Tensor LT
tensor_lt_images = [
    "A futuristic digital landscape with a prominent 'TensorRT-LLM' logo showcasing the concept of embarking on a journey into the future of language models. The imagery emphasizes the cutting-edge nature of the toolbox.",
    "A visual representation of NVIDIA GPUs interconnected with pipelines and parallelism arrows symbolizing the power of Tensor Parallelism and Pipeline Parallelism. This image highlights high-performance inference with TensorRT-LLM on GPUs.",
    "A computer screen displaying code in Python accompanied by icons of LLM models like BERT and GPT. This conveys the idea of effortless model creation and customization using the Python API inspired by PyTorch.",
    "A matrix displaying different numerical precisions (FP32, FP16, INT8, and INT4) alongside a graph showing rigorous testing on NVIDIA GPUs. This image illustrates the precision and performance of TensorRT-LLM.",
    "An illustration of a toolbox transforming into a powerful engine with gears, cogs, and advanced features like Multi-head Attention and In-flight Batching. This imagery represents the versatility and capabilities of TensorRT-LLM emphasizing its role as a powerhouse."
]


# Combine the two lists into a 2D list
images_2d_list = [local_send_images, tensor_lt_images]


pipeline = AutoPipelineForText2Image.from_pretrained(
	"kandinsky-community/kandinsky-2-2-decoder", torch_dtype=torch.float32
).to()

images = []

for idl, repo in enumerate(images_2d_list):
	for idp, rompt in enumerate(repo):

	image = pipeline(
		prompt="{}, reaslistic, detailed, 8k".format(prompt), 
		negative_prompt="low quality, bad quality, neon colors, bad anatomy", 
		guidance_scale=7.5,
		height=768,
		width=360,
	).images[0]

	image.save("{}{}.png".format(idl,idp))