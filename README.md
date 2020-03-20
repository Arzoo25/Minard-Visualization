# Minard-Visualization

The Minard dataset contains data about Napoleons army’sadvance into(in 1812) and retreat from Russia (in 1813).

In Figure 1, I am depicting the path of advance and retreat of the troops represented by colours brown and black respectively. The survivors along the path can be inferred based on the thickness of the path, the narrower the path,the lesser the survivors and the scale for the same is also provided in the depiction. I am making use of functions like “ggplot”and “geom_path” for plotting the figure.

In Figure 2, the temperature along the path of retreat has been plotted from 24 October to 7 Decemberby the orange lines. “ggplot”, “geom_path” and “geom_point” has been utilized in the depiction.

In Figure 3, Iam visualizing the position of cities and the path the troops took through these cities. The pink path is the path of advance of the army while the blue represents the path of retreat. Similar to Figure 1, the thickness of the path represents the number of survivors. “ggmap”and “get_stamenmap”has been used to get the cities plotted in the correct positions with maptype = "terrain-lines"for outlining the states of Russia. “ggmap”, “geom_path”and “geom_point”are being combined to plot this figure
