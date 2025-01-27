USE MurachCollege;

CREATE LOGIN JimRhodes WITH PASSWORD = 'HelloJimR!',
    DEFAULT_DATABASE = MurachCollege;

CREATE USER JimRhodes FOR LOGIN JimRhodes;