<img width="425" alt="logo" src="/assets/logo.png">

# Re-Clip - Research Paper and GitHub Repo Video Summarizer

Re-Clip is a mobile application that revolutionizes the way we engage with research papers and GitHub repositories. By leveraging cutting-edge technologies like LangChang, MoviePy, Flask, Diffusion (an AI art generator), and Swift, Re-Clip is designed to summarize and generate captivating video content from research papers and GitHub repos, making them more accessible and engaging to users. In essence, it's like a social media platform specifically tailored for the world of research papers and git repos.

| Our System | iOS App |
| ---------- | ------- |
|<img height="450" alt="logo" src="/assets/infra.png">|<img height="450" alt="logo" src="/assets/scroll.gif">| 


## Key Features

### 1. Paper/Repo Summarization
Re-Clip utilizes advanced natural language processing techniques provided by LangChang to extract key insights and summarize research papers and GitHub repositories. This feature ensures that users can quickly grasp the essence of the content.

### 2. Video Generation
With the help of MoviePy, Re-Clip transforms the summarized content into short, visually engaging videos or reels. This not only simplifies the understanding of complex concepts but also enhances the overall viewing experience.

### 3. User-Friendly Interface
Re-Clip combines technical elements of research papers and GitHub repositories with a sleek and intuitive user interface. The application's design is geared towards providing a seamless and enjoyable experience for users, encouraging them to explore more.

### 4. AI-Generated Art Integration
Re-Clip takes it a step further by incorporating AI-generated art using Diffusion. This feature adds a unique and visually stimulating dimension to the content, making the experience even more captivating.

### 5. Swift Mobile Application
The Re-Clip mobile app is built using Swift, ensuring a smooth and responsive user experience on iOS devices. The app is designed to make it easy for users to access and interact with research papers and GitHub repositories.

## How we built it
We built the app in two parts: an iOS mobile app and a backend ML pipeline in Python. The former offers the highly addictive infinite scroller interface with our videos and the latter takes long-form content—research papers and GitHub repos—and creates short videos. 
* The iOS app was implemented by mimicking the familiar TikTok UI using SwiftUI. The backend pipeline had several parts, it contained a summarization service, a text-to-speech service and a video creation service. 
* The summarization service took salient paragraphs of a research paper (abstract and conclusion) or the README.md of a GitHub repository and converted it to a chunked video script. This was done using the LangChain library and used the [`text-davinci-003`](https://platform.openai.com/docs/models) OpenAI model to carry out the summarization. The summary was in the form of a `.srt` file, the specification for subtitles.
* The TTS service called the **Google Cloud** [Text-to-Speech API](https://cloud.google.com/text-to-speech) to generate a natural sounding narration of our script. 
* The video generation service generated a video using the narration, subtitles and scraped pictures from the long-form resource. This was done using the [MoviePy](https://zulko.github.io/moviepy/) package.

## License

Re-Clip is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.


Happy exploring! 🚀
