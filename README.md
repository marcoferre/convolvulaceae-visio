# convolvulaceae-visio

## The Idea

Listening to music can’t avoid unconscious memories and feelings. Some of those are sharp and well defined (an experience, a place), others are blurry and faint (feel of darkness, joy or loneliness). 

Our convolvulaceae>visio project wants to create this kind of “double faced” feelings both merged in one single psychedelic flavour media by generating a videoclip that will be complementary to the mood that the audio segment is conveying.

## The Flow

![image](https://user-images.githubusercontent.com/37837986/132510959-f36c4fc3-f309-4dea-ae19-0ce0fdf92749.png)

## Usage

Execute the convolvulaceae-visio.ipynb Notebook you find in the repository following the instruction and geneterate your own convolvulaceae-visio experience!

## Input

convolvulaceae-visio.ipynb is a notebook that receives as input a YouTube link or an audiofile from local directory.

## Output

Generate the following output: 
- convolvulaceae-visio.mp4 output video
- prediction.json with valence arousal predictions of the audio (to use with processing-visualizer)
- classes_va.json with classes (to use with processing-visualizer)
- audiofile.wav (to use with processing-visualizer)

## Architecture

In /tools you find the notebooks with the utility in support to the convolvulaceae-visio code.
- Data Processing - CNN Training.ipynb used to train the model that regresses Valence, Arousal values for an arbitrary audio file.
- WordValenceArousalPredictor.ipynb 
- ClassMapping.ipynb to map ImageNet Classes with Valence Arousal values.

## Example 
https://www.youtube.com/playlist?list=PL1fJ0Sl0WzzN29HOS2Vx8gfQ5h3JulnOM
