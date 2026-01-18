import owlready2
onto=owlready2.get_ontology("file1.owx").load()
tracks=list(onto.track.instances())
artists=list(onto.artist.instances())
genres=list(onto.genre.instances())
periods=list(onto.period.instances())
print('Исполнители')
for i in range(len(artists)):
    artist_name=str(artists[i]).split(".")[-1].replace("_"," ")
    print(i+1,'.',artist_name)
artist_choice=int(input("\nВведите номер исполнителя: "))-1
selected_artist=artists[artist_choice]
print('Жанры')
for i in range(len(genres)):
    genre_name=str(genres[i]).split(".")[-1].replace("_"," ")
    print(i+1,'.',genre_name)
genre_choice=int(input("\nВведите номер жанра:"))-1
selected_genre=genres[genre_choice]
print('Периоды')
for i in range(len(periods)):
    period_name=str(periods[i]).split(".")[-1].replace("_"," ")
    print(i+1,'.',period_name)
period_choice=int(input("\nВведите номер периода: ")) - 1
selected_period=periods[period_choice]
print("НАЙДЕННЫЕ ТРЕКИ:")
found_all=False
for track in tracks:
    has_correct_artist=False
    has_correct_genre=False
    has_correct_period=False
    if hasattr(track,'Createdby'):
        track_artists = track.Createdby
        if selected_artist in track_artists:
            has_correct_artist=True
    if hasattr(track,'hasgenre'):
        track_genres=track.hasgenre
        if selected_genre in track_genres:
            has_correct_genre=True
    if hasattr(track,'hasperiod'):
        track_periods=track.hasperiod
        if selected_period in track_periods:
            has_correct_period=True
    if has_correct_artist and has_correct_genre and has_correct_period:
        found_all=True
        track_name=str(track).split(".")[-1].replace("_"," ")
        if hasattr(track,'Createdby'):
            track_artists=track.Createdby
            artist_name=str(track_artists[0]).split(".")[-1].replace("_"," ")
            print(track_name,'—',artist_name)
if not found_all:
    print('Треки не найдены')

