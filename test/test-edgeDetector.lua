-- Testing the Mexican hat for edge detection

require 'image'
require 'edgeDetector'

-- initialising cameras and required needed packages

require 'xlua'
require 'camera'
width = 400
height = 300
fps = 30 
--dir = 'test_vid_two'

sys.execute(string.format('mkdir -p %s',dir))

camera1 = image.Camera{idx=1,width=width,height=height,fps=fps}
iCameraLc = camera1:forward() -- acquiring image from the LEFT camera
iCameraL = image.rgb2y(iCameraLc)

edges = edgeDetector(iCameraL)

image.display{image = edges, legend = 'Image edges', zoom = 3}
image.display{image = iCameraL, legend = 'Greyscale input image', zoom = 3}

print(iCameraL:size())
print(iCameraL[1]:size())
print(iCameraL[1]:min())
print(iCameraL[1]:max())

gnuplot.figure(1)
gnuplot.hist(iCameraL[1],100)
gnuplot.title('iCameraL[1]')

print(edges:size())
print(edges[1]:size())
print(edges[1]:min())
print(edges[1]:max())

gnuplot.epsfigure('histEdges.eps')
gnuplot.figure(2)
gnuplot.hist(edges[1],100,-.2,.2)
gnuplot.title('edges[1]')
gnuplot.raw('set terminal postscript enhanced "Helvetica" 24')
gnuplot.plotflush()
