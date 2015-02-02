CREATE TABLE tnames      (id         INTEGER PRIMARY KEY,
                          name       TEXT,
                          price      INTEGER,
                          image_url  TEXT
                         );

CREATE TABLE ttypes     (id          INTEGER PRIMARY KEY,
                         color       TEXT,
                         gender      CHARACTER(1),
                         size        CHARACTER(2),
                         tname_id    INTEGER references tnames,
                         quantity    INTEGER
                        );

CREATE TABLE buyers    (id           INTEGER PRIMARY KEY,
                        name         TEXT,
                        email        TEXT
                        );

CREATE TABLE purchases (id           INTEGER PRIMARY KEY,
                        ttypes_id    INTEGER references ttypes,
                        buyers_id    INTEGER references buyers,
                        quantity     INTEGER
                       );
