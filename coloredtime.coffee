# A widget for Uebersicht https://github.com/felixhageloh/uebersicht
# that replicates http://whatcolourisit.scn9a.org
# by totallyuneekname https://github.com/totallyuneekname

# retrieve 24 hour time
command: "date +'%T'"

# the refresh frequency in milliseconds
# keep at 1000 so that clock refreshes every second
refreshFrequency: 1000

# Create simple outline
render: (output) -> """
	<div id="container">
    	<p id="clock">#{output.replace(/:/g, ' : ')}</p>
    	<p id="color">##{output.replace(/:/g, '')}</p>
	</div>
"""

# the CSS style for this widget, written using Stylus
# (http://learnboost.github.io/stylus/)
style: """
	#container
		color white // Color of text
		font-family Helvetica Neue
		font-weight 200 // You may prefer the text to be lighter, or heavier
		padding-top 20% // Not sure why the container won't touch the top of the window, but it won't.
		width 100vw
		height 100vh
		text-align center
	#clock
		font-size 600% // Size of clock. Feel free to customize
	#color
		font-size 200% // Size of hex color. Feel free to customize
"""
# Run this every second to update content
update: (output, domEl) ->
	# Change color of background to time (output without the colons)
	$(domEl).find("#container").css "background", "#"+output.replace(/:/g, '')

	# Change the clock contents to current time (spacing out colons, looks nicer imo)
	$(domEl).find("#clock").html output.replace(/:/g, " : ")

	# Finally change the contents of the hex color (again, output without colons)
	$(domEl).find("#color").html "#"+output.replace(/:/g, "")