CREATE TABLE IF NOT EXISTS Performer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    release DATE NOT NULL,
    CONSTRAINT chk_release_date CHECK (EXTRACT(YEAR FROM release) >= 2000)
);

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    duration INTEGER NOT NULL,
    album_id SMALLINT NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collection (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    collection_release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS GenrePerformer (
    id SERIAL PRIMARY KEY,
    GenreId SMALLINT NOT NULL REFERENCES Genre(id),
    PerformerId SMALLINT NOT NULL REFERENCES Performer(id)
);

CREATE TABLE IF NOT EXISTS PerformerAlbums (
    id SERIAL PRIMARY KEY,
    AlbumId SMALLINT NOT NULL REFERENCES Albums(id),
    PerformerId SMALLINT NOT NULL REFERENCES Performer(id)
);

CREATE TABLE IF NOT EXISTS CollectionTrack (
    id SERIAL PRIMARY KEY,
    CollectionId SMALLINT NOT NULL REFERENCES Collection(id),
    TrackId SMALLINT NOT NULL REFERENCES Track(id)
);