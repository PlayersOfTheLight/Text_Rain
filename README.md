# TextRain
Interact with text overlayed on video
/* Text Rain: Reimplementaion by Sana Sarfraz Sharon Spielman and Susan Chen
 * Credits:
 * -Original concept by Camille Utterback http://camilleutterback.com/projects/text-rain/ 
 * -Baseline implementaion by Marlena Abraham
 *  -Tutorial from Daniel Shiffman about Capture
 *  -Talked with John Ozbay about implementation ideas and libraries
 *  -Capture library documentation on Processing.org
 */

In order to run this implementation, you will need to download the Processing IDE https://processing.org/download/?processing

Go to Sketch->Import Libraries->Install Video library if there is no green checkmark next to the library 

Text_Rain.pde is the main file. It initializes the cameras and data stuructes, plays the video, identifies dark and light areas of the video, and overlays text on the boundries. Calls subroutines in Letter.pde. 

Letter.pde is the file that contains the font and letter movement subroutines. 

Click the play button on Text_Rain.pde to start the show! 
