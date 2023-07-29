{ oself, fetchFromGitHub }:

with oself;

{
  melange-fetch = buildDunePackage {
    pname = "melange-fetch";
    version = "n/a";
    src = fetchFromGitHub {
      owner = "melange-community";
      repo = "melange-fetch";
      rev = "d2183ec245cbf5c7a8f99f8c41d2de0758c8cda7";
      hash = "sha256-HP+DfQSeOYCzKVdsnPLpDP/qz8bU9YNaJD2TPPfV7Hs=";
    };
    nativeBuildInputs = [ melange ];
    propagatedBuildInputs = [ melange ];
  };

  melange-json = buildDunePackage
    {
      pname = "melange-json";
      version = "n/a";
      src = fetchFromGitHub {
        owner = "melange-community";
        repo = "melange-json";
        rev = "bfeb902da1f0b1d2793277c84777c4bf4c094af8";
        sha256 = "sha256-hN/5fKQ6Y/96Hpin/FKmdtqM3jfXP7UL/wSFfl/86SA=";
      };
      nativeBuildInputs = [ melange ];
      buildInputs = [ melange ];
    };

  melange-relay = buildDunePackage {
    pname = "melange-relay";
    version = "n/a";
    src = fetchFromGitHub {
      owner = "anmonteiro";
      repo = "melange-relay";
      rev = "edae6cdcd1d27d4fe5cdcb6cb4b944ebf8ff9d8b";
      hash = "sha256-4p9dvztRREqw5XUDNIkiAsLBCo2zAwgUZCCSBKEry/w=";
      sparseCheckout = [ "packages/rescript-relay" ];
    };
    nativeBuildInputs = [ melange reason ];
    propagatedBuildInputs = [
      reason-react
      reason-react-ppx
      graphql_parser
      melange
    ];
  };

  reason-react = buildDunePackage {
    pname = "reason-react";
    version = "n/a";
    inherit (reason-react-ppx) src;
    nativeBuildInputs = [ reason melange ];
    propagatedBuildInputs = [ reason-react-ppx melange ];
  };

  reason-react-ppx = buildDunePackage {
    pname = "reason-react-ppx";
    version = "n/a";
    src = fetchFromGitHub {
      owner = "reasonml";
      repo = "reason-react";
      rev = "52aa51b8a0e85788f6d775b409a5594c0022691f";
      hash = "sha256-eTT63YwOMY+gZ6jzPBNH4Ql/FfLY3AVEEclcPtyx+0Q=";
    };
    propagatedBuildInputs = [ ppxlib ];
  };

  rescript-syntax = buildDunePackage {
    pname = "rescript-syntax";
    version = "n/a";
    inherit (melange) src patches;
    propagatedBuildInputs = [ ppxlib melange ];
  };
}
