#http://download.geofabrik.de/europe/germany.html
osmconvert64-0.8.8p.exe niedersachsen-latest.osm.pbf --all-to-nodes -o=niedersachsen.osm
osmconvert64-0.8.8p niedersachsen.osm --all-to-nodes --csv="@id @lon @lat shop name addr:street addr:housenumber addr:city website email" --csv-headline -o=niedersachsen.csv