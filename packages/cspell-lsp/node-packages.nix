{
  nodeEnv,
  fetchurl,
  fetchgit,
  nix-gitignore,
  stdenv,
  lib,
  globalBuildInputs ? [ ],
}:

let
  sources = {
    "@75lb/nature-0.1.10" = {
      name = "_at_75lb_slash_nature";
      packageName = "@75lb/nature";
      version = "0.1.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/@75lb/nature/-/nature-0.1.10.tgz";
        sha512 = "jr9RSnPJzHWUFjNxq8g3LI5tMElG39HaJs4qWC2E/Ooo223PjZK+6MwfAWN1BFRu9/pWA+unS/YhSZVu8mUlmg==";
      };
    };
    "@cspell/cspell-bundled-dicts-8.19.4" = {
      name = "_at_cspell_slash_cspell-bundled-dicts";
      packageName = "@cspell/cspell-bundled-dicts";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/cspell-bundled-dicts/-/cspell-bundled-dicts-8.19.4.tgz";
        sha512 = "2ZRcZP/ncJ5q953o8i+R0fb8+14PDt5UefUNMrFZZHvfTI0jukAASOQeLY+WT6ASZv6CgbPrApAdbppy9FaXYQ==";
      };
    };
    "@cspell/cspell-pipe-8.19.4" = {
      name = "_at_cspell_slash_cspell-pipe";
      packageName = "@cspell/cspell-pipe";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/cspell-pipe/-/cspell-pipe-8.19.4.tgz";
        sha512 = "GNAyk+7ZLEcL2fCMT5KKZprcdsq3L1eYy3e38/tIeXfbZS7Sd1R5FXUe6CHXphVWTItV39TvtLiDwN/2jBts9A==";
      };
    };
    "@cspell/cspell-resolver-8.19.4" = {
      name = "_at_cspell_slash_cspell-resolver";
      packageName = "@cspell/cspell-resolver";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/cspell-resolver/-/cspell-resolver-8.19.4.tgz";
        sha512 = "S8vJMYlsx0S1D60glX8H2Jbj4mD8519VjyY8lu3fnhjxfsl2bDFZvF3ZHKsLEhBE+Wh87uLqJDUJQiYmevHjDg==";
      };
    };
    "@cspell/cspell-service-bus-8.19.4" = {
      name = "_at_cspell_slash_cspell-service-bus";
      packageName = "@cspell/cspell-service-bus";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/cspell-service-bus/-/cspell-service-bus-8.19.4.tgz";
        sha512 = "uhY+v8z5JiUogizXW2Ft/gQf3eWrh5P9036jN2Dm0UiwEopG/PLshHcDjRDUiPdlihvA0RovrF0wDh4ptcrjuQ==";
      };
    };
    "@cspell/cspell-types-8.19.4" = {
      name = "_at_cspell_slash_cspell-types";
      packageName = "@cspell/cspell-types";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/cspell-types/-/cspell-types-8.19.4.tgz";
        sha512 = "ekMWuNlFiVGfsKhfj4nmc8JCA+1ZltwJgxiKgDuwYtR09ie340RfXFF6YRd2VTW5zN7l4F1PfaAaPklVz6utSg==";
      };
    };
    "@cspell/dict-ada-4.1.1" = {
      name = "_at_cspell_slash_dict-ada";
      packageName = "@cspell/dict-ada";
      version = "4.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-ada/-/dict-ada-4.1.1.tgz";
        sha512 = "E+0YW9RhZod/9Qy2gxfNZiHJjCYFlCdI69br1eviQQWB8yOTJX0JHXLs79kOYhSW0kINPVUdvddEBe6Lu6CjGQ==";
      };
    };
    "@cspell/dict-al-1.1.1" = {
      name = "_at_cspell_slash_dict-al";
      packageName = "@cspell/dict-al";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-al/-/dict-al-1.1.1.tgz";
        sha512 = "sD8GCaZetgQL4+MaJLXqbzWcRjfKVp8x+px3HuCaaiATAAtvjwUQ5/Iubiqwfd1boIh2Y1/3EgM3TLQ7Q8e0wQ==";
      };
    };
    "@cspell/dict-aws-4.0.14" = {
      name = "_at_cspell_slash_dict-aws";
      packageName = "@cspell/dict-aws";
      version = "4.0.14";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-aws/-/dict-aws-4.0.14.tgz";
        sha512 = "qLPR+OFmpzyUcuUYyCQFIURDDUGIlQsdGirPyvaIrXxs2giCKG97cAuFz5EleL3/Lo7uJAVDw0lt4Ka7wIRhjQ==";
      };
    };
    "@cspell/dict-bash-4.2.1" = {
      name = "_at_cspell_slash_dict-bash";
      packageName = "@cspell/dict-bash";
      version = "4.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-bash/-/dict-bash-4.2.1.tgz";
        sha512 = "SBnzfAyEAZLI9KFS7DUG6Xc1vDFuLllY3jz0WHvmxe8/4xV3ufFE3fGxalTikc1VVeZgZmxYiABw4iGxVldYEg==";
      };
    };
    "@cspell/dict-companies-3.2.3" = {
      name = "_at_cspell_slash_dict-companies";
      packageName = "@cspell/dict-companies";
      version = "3.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-companies/-/dict-companies-3.2.3.tgz";
        sha512 = "7ekwamRYeS7G3I3LEKM3t0WIyAytCbsx2I2h2z2eEvF+b3TmtJVcV7UI7BScLue3bep4sPB/b4CV3BUv3QfyzQ==";
      };
    };
    "@cspell/dict-cpp-6.0.9" = {
      name = "_at_cspell_slash_dict-cpp";
      packageName = "@cspell/dict-cpp";
      version = "6.0.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-cpp/-/dict-cpp-6.0.9.tgz";
        sha512 = "Xdq9MwGh0D5rsnbOqFW24NIClXXRhN11KJdySMibpcqYGeomxB2ODFBuhj1H7azO7kVGkGH0Okm4yQ2TRzBx0g==";
      };
    };
    "@cspell/dict-cryptocurrencies-5.0.5" = {
      name = "_at_cspell_slash_dict-cryptocurrencies";
      packageName = "@cspell/dict-cryptocurrencies";
      version = "5.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-cryptocurrencies/-/dict-cryptocurrencies-5.0.5.tgz";
        sha512 = "R68hYYF/rtlE6T/dsObStzN5QZw+0aQBinAXuWCVqwdS7YZo0X33vGMfChkHaiCo3Z2+bkegqHlqxZF4TD3rUA==";
      };
    };
    "@cspell/dict-csharp-4.0.7" = {
      name = "_at_cspell_slash_dict-csharp";
      packageName = "@cspell/dict-csharp";
      version = "4.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-csharp/-/dict-csharp-4.0.7.tgz";
        sha512 = "H16Hpu8O/1/lgijFt2lOk4/nnldFtQ4t8QHbyqphqZZVE5aS4J/zD/WvduqnLY21aKhZS6jo/xF5PX9jyqPKUA==";
      };
    };
    "@cspell/dict-css-4.0.18" = {
      name = "_at_cspell_slash_dict-css";
      packageName = "@cspell/dict-css";
      version = "4.0.18";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-css/-/dict-css-4.0.18.tgz";
        sha512 = "EF77RqROHL+4LhMGW5NTeKqfUd/e4OOv6EDFQ/UQQiFyWuqkEKyEz0NDILxOFxWUEVdjT2GQ2cC7t12B6pESwg==";
      };
    };
    "@cspell/dict-dart-2.3.1" = {
      name = "_at_cspell_slash_dict-dart";
      packageName = "@cspell/dict-dart";
      version = "2.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-dart/-/dict-dart-2.3.1.tgz";
        sha512 = "xoiGnULEcWdodXI6EwVyqpZmpOoh8RA2Xk9BNdR7DLamV/QMvEYn8KJ7NlRiTSauJKPNkHHQ5EVHRM6sTS7jdg==";
      };
    };
    "@cspell/dict-data-science-2.0.9" = {
      name = "_at_cspell_slash_dict-data-science";
      packageName = "@cspell/dict-data-science";
      version = "2.0.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-data-science/-/dict-data-science-2.0.9.tgz";
        sha512 = "wTOFMlxv06veIwKdXUwdGxrQcK44Zqs426m6JGgHIB/GqvieZQC5n0UI+tUm5OCxuNyo4OV6mylT4cRMjtKtWQ==";
      };
    };
    "@cspell/dict-django-4.1.5" = {
      name = "_at_cspell_slash_dict-django";
      packageName = "@cspell/dict-django";
      version = "4.1.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-django/-/dict-django-4.1.5.tgz";
        sha512 = "AvTWu99doU3T8ifoMYOMLW2CXKvyKLukPh1auOPwFGHzueWYvBBN+OxF8wF7XwjTBMMeRleVdLh3aWCDEX/ZWg==";
      };
    };
    "@cspell/dict-docker-1.1.16" = {
      name = "_at_cspell_slash_dict-docker";
      packageName = "@cspell/dict-docker";
      version = "1.1.16";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-docker/-/dict-docker-1.1.16.tgz";
        sha512 = "UiVQ5RmCg6j0qGIxrBnai3pIB+aYKL3zaJGvXk1O/ertTKJif9RZikKXCEgqhaCYMweM4fuLqWSVmw3hU164Iw==";
      };
    };
    "@cspell/dict-dotnet-5.0.10" = {
      name = "_at_cspell_slash_dict-dotnet";
      packageName = "@cspell/dict-dotnet";
      version = "5.0.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-dotnet/-/dict-dotnet-5.0.10.tgz";
        sha512 = "ooar8BP/RBNP1gzYfJPStKEmpWy4uv/7JCq6FOnJLeD1yyfG3d/LFMVMwiJo+XWz025cxtkM3wuaikBWzCqkmg==";
      };
    };
    "@cspell/dict-elixir-4.0.8" = {
      name = "_at_cspell_slash_dict-elixir";
      packageName = "@cspell/dict-elixir";
      version = "4.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-elixir/-/dict-elixir-4.0.8.tgz";
        sha512 = "CyfphrbMyl4Ms55Vzuj+mNmd693HjBFr9hvU+B2YbFEZprE5AG+EXLYTMRWrXbpds4AuZcvN3deM2XVB80BN/Q==";
      };
    };
    "@cspell/dict-en-common-misspellings-2.1.3" = {
      name = "_at_cspell_slash_dict-en-common-misspellings";
      packageName = "@cspell/dict-en-common-misspellings";
      version = "2.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-en-common-misspellings/-/dict-en-common-misspellings-2.1.3.tgz";
        sha512 = "v1I97Hr1OrK+mwHsVzbY4vsPxx6mA5quhxzanF6XuRofz00wH4HPz8Q3llzRHxka5Wl/59gyan04UkUrvP4gdA==";
      };
    };
    "@cspell/dict-en-gb-1.1.33" = {
      name = "_at_cspell_slash_dict-en-gb";
      packageName = "@cspell/dict-en-gb";
      version = "1.1.33";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-en-gb/-/dict-en-gb-1.1.33.tgz";
        sha512 = "tKSSUf9BJEV+GJQAYGw5e+ouhEe2ZXE620S7BLKe3ZmpnjlNG9JqlnaBhkIMxKnNFkLY2BP/EARzw31AZnOv4g==";
      };
    };
    "@cspell/dict-en_us-4.4.16" = {
      name = "_at_cspell_slash_dict-en_us";
      packageName = "@cspell/dict-en_us";
      version = "4.4.16";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-en_us/-/dict-en_us-4.4.16.tgz";
        sha512 = "/R47sUbUmba2dG/0LZyE6P6gX/DRF1sCcYNQNWyPk/KeidQRNZG+FH9U0KRvX42/2ZzMge6ebXH3WAJ52w0Vqw==";
      };
    };
    "@cspell/dict-filetypes-3.0.13" = {
      name = "_at_cspell_slash_dict-filetypes";
      packageName = "@cspell/dict-filetypes";
      version = "3.0.13";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-filetypes/-/dict-filetypes-3.0.13.tgz";
        sha512 = "g6rnytIpQlMNKGJT1JKzWkC+b3xCliDKpQ3ANFSq++MnR4GaLiifaC4JkVON11Oh/UTplYOR1nY3BR4X30bswA==";
      };
    };
    "@cspell/dict-flutter-1.1.1" = {
      name = "_at_cspell_slash_dict-flutter";
      packageName = "@cspell/dict-flutter";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-flutter/-/dict-flutter-1.1.1.tgz";
        sha512 = "UlOzRcH2tNbFhZmHJN48Za/2/MEdRHl2BMkCWZBYs+30b91mWvBfzaN4IJQU7dUZtowKayVIF9FzvLZtZokc5A==";
      };
    };
    "@cspell/dict-fonts-4.0.5" = {
      name = "_at_cspell_slash_dict-fonts";
      packageName = "@cspell/dict-fonts";
      version = "4.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-fonts/-/dict-fonts-4.0.5.tgz";
        sha512 = "BbpkX10DUX/xzHs6lb7yzDf/LPjwYIBJHJlUXSBXDtK/1HaeS+Wqol4Mlm2+NAgZ7ikIE5DQMViTgBUY3ezNoQ==";
      };
    };
    "@cspell/dict-fsharp-1.1.1" = {
      name = "_at_cspell_slash_dict-fsharp";
      packageName = "@cspell/dict-fsharp";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-fsharp/-/dict-fsharp-1.1.1.tgz";
        sha512 = "imhs0u87wEA4/cYjgzS0tAyaJpwG7vwtC8UyMFbwpmtw+/bgss+osNfyqhYRyS/ehVCWL17Ewx2UPkexjKyaBA==";
      };
    };
    "@cspell/dict-fullstack-3.2.7" = {
      name = "_at_cspell_slash_dict-fullstack";
      packageName = "@cspell/dict-fullstack";
      version = "3.2.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-fullstack/-/dict-fullstack-3.2.7.tgz";
        sha512 = "IxEk2YAwAJKYCUEgEeOg3QvTL4XLlyArJElFuMQevU1dPgHgzWElFevN5lsTFnvMFA1riYsVinqJJX0BanCFEg==";
      };
    };
    "@cspell/dict-gaming-terms-1.1.2" = {
      name = "_at_cspell_slash_dict-gaming-terms";
      packageName = "@cspell/dict-gaming-terms";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-gaming-terms/-/dict-gaming-terms-1.1.2.tgz";
        sha512 = "9XnOvaoTBscq0xuD6KTEIkk9hhdfBkkvJAIsvw3JMcnp1214OCGW8+kako5RqQ2vTZR3Tnf3pc57o7VgkM0q1Q==";
      };
    };
    "@cspell/dict-git-3.0.7" = {
      name = "_at_cspell_slash_dict-git";
      packageName = "@cspell/dict-git";
      version = "3.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-git/-/dict-git-3.0.7.tgz";
        sha512 = "odOwVKgfxCQfiSb+nblQZc4ErXmnWEnv8XwkaI4sNJ7cNmojnvogYVeMqkXPjvfrgEcizEEA4URRD2Ms5PDk1w==";
      };
    };
    "@cspell/dict-golang-6.0.23" = {
      name = "_at_cspell_slash_dict-golang";
      packageName = "@cspell/dict-golang";
      version = "6.0.23";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-golang/-/dict-golang-6.0.23.tgz";
        sha512 = "oXqUh/9dDwcmVlfUF5bn3fYFqbUzC46lXFQmi5emB0vYsyQXdNWsqi6/yH3uE7bdRE21nP7Yo0mR1jjFNyLamg==";
      };
    };
    "@cspell/dict-google-1.0.9" = {
      name = "_at_cspell_slash_dict-google";
      packageName = "@cspell/dict-google";
      version = "1.0.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-google/-/dict-google-1.0.9.tgz";
        sha512 = "biL65POqialY0i4g6crj7pR6JnBkbsPovB2WDYkj3H4TuC/QXv7Pu5pdPxeUJA6TSCHI7T5twsO4VSVyRxD9CA==";
      };
    };
    "@cspell/dict-haskell-4.0.6" = {
      name = "_at_cspell_slash_dict-haskell";
      packageName = "@cspell/dict-haskell";
      version = "4.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-haskell/-/dict-haskell-4.0.6.tgz";
        sha512 = "ib8SA5qgftExpYNjWhpYIgvDsZ/0wvKKxSP+kuSkkak520iPvTJumEpIE+qPcmJQo4NzdKMN8nEfaeci4OcFAQ==";
      };
    };
    "@cspell/dict-html-4.0.12" = {
      name = "_at_cspell_slash_dict-html";
      packageName = "@cspell/dict-html";
      version = "4.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-html/-/dict-html-4.0.12.tgz";
        sha512 = "JFffQ1dDVEyJq6tCDWv0r/RqkdSnV43P2F/3jJ9rwLgdsOIXwQbXrz6QDlvQLVvNSnORH9KjDtenFTGDyzfCaA==";
      };
    };
    "@cspell/dict-html-symbol-entities-4.0.4" = {
      name = "_at_cspell_slash_dict-html-symbol-entities";
      packageName = "@cspell/dict-html-symbol-entities";
      version = "4.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-html-symbol-entities/-/dict-html-symbol-entities-4.0.4.tgz";
        sha512 = "afea+0rGPDeOV9gdO06UW183Qg6wRhWVkgCFwiO3bDupAoyXRuvupbb5nUyqSTsLXIKL8u8uXQlJ9pkz07oVXw==";
      };
    };
    "@cspell/dict-java-5.0.12" = {
      name = "_at_cspell_slash_dict-java";
      packageName = "@cspell/dict-java";
      version = "5.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-java/-/dict-java-5.0.12.tgz";
        sha512 = "qPSNhTcl7LGJ5Qp6VN71H8zqvRQK04S08T67knMq9hTA8U7G1sTKzLmBaDOFhq17vNX/+rT+rbRYp+B5Nwza1A==";
      };
    };
    "@cspell/dict-julia-1.1.1" = {
      name = "_at_cspell_slash_dict-julia";
      packageName = "@cspell/dict-julia";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-julia/-/dict-julia-1.1.1.tgz";
        sha512 = "WylJR9TQ2cgwd5BWEOfdO3zvDB+L7kYFm0I9u0s9jKHWQ6yKmfKeMjU9oXxTBxIufhCXm92SKwwVNAC7gjv+yA==";
      };
    };
    "@cspell/dict-k8s-1.0.12" = {
      name = "_at_cspell_slash_dict-k8s";
      packageName = "@cspell/dict-k8s";
      version = "1.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-k8s/-/dict-k8s-1.0.12.tgz";
        sha512 = "2LcllTWgaTfYC7DmkMPOn9GsBWsA4DZdlun4po8s2ysTP7CPEnZc1ZfK6pZ2eI4TsZemlUQQ+NZxMe9/QutQxg==";
      };
    };
    "@cspell/dict-kotlin-1.1.1" = {
      name = "_at_cspell_slash_dict-kotlin";
      packageName = "@cspell/dict-kotlin";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-kotlin/-/dict-kotlin-1.1.1.tgz";
        sha512 = "J3NzzfgmxRvEeOe3qUXnSJQCd38i/dpF9/t3quuWh6gXM+krsAXP75dY1CzDmS8mrJAlBdVBeAW5eAZTD8g86Q==";
      };
    };
    "@cspell/dict-latex-4.0.4" = {
      name = "_at_cspell_slash_dict-latex";
      packageName = "@cspell/dict-latex";
      version = "4.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-latex/-/dict-latex-4.0.4.tgz";
        sha512 = "YdTQhnTINEEm/LZgTzr9Voz4mzdOXH7YX+bSFs3hnkUHCUUtX/mhKgf1CFvZ0YNM2afjhQcmLaR9bDQVyYBvpA==";
      };
    };
    "@cspell/dict-lorem-ipsum-4.0.5" = {
      name = "_at_cspell_slash_dict-lorem-ipsum";
      packageName = "@cspell/dict-lorem-ipsum";
      version = "4.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-lorem-ipsum/-/dict-lorem-ipsum-4.0.5.tgz";
        sha512 = "9a4TJYRcPWPBKkQAJ/whCu4uCAEgv/O2xAaZEI0n4y1/l18Yyx8pBKoIX5QuVXjjmKEkK7hi5SxyIsH7pFEK9Q==";
      };
    };
    "@cspell/dict-lua-4.0.8" = {
      name = "_at_cspell_slash_dict-lua";
      packageName = "@cspell/dict-lua";
      version = "4.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-lua/-/dict-lua-4.0.8.tgz";
        sha512 = "N4PkgNDMu9JVsRu7JBS/3E/dvfItRgk9w5ga2dKq+JupP2Y3lojNaAVFhXISh4Y0a6qXDn2clA6nvnavQ/jjLA==";
      };
    };
    "@cspell/dict-makefile-1.0.5" = {
      name = "_at_cspell_slash_dict-makefile";
      packageName = "@cspell/dict-makefile";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-makefile/-/dict-makefile-1.0.5.tgz";
        sha512 = "4vrVt7bGiK8Rx98tfRbYo42Xo2IstJkAF4tLLDMNQLkQ86msDlYSKG1ZCk8Abg+EdNcFAjNhXIiNO+w4KflGAQ==";
      };
    };
    "@cspell/dict-markdown-2.0.12" = {
      name = "_at_cspell_slash_dict-markdown";
      packageName = "@cspell/dict-markdown";
      version = "2.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-markdown/-/dict-markdown-2.0.12.tgz";
        sha512 = "ufwoliPijAgWkD/ivAMC+A9QD895xKiJRF/fwwknQb7kt7NozTLKFAOBtXGPJAB4UjhGBpYEJVo2elQ0FCAH9A==";
      };
    };
    "@cspell/dict-monkeyc-1.0.11" = {
      name = "_at_cspell_slash_dict-monkeyc";
      packageName = "@cspell/dict-monkeyc";
      version = "1.0.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-monkeyc/-/dict-monkeyc-1.0.11.tgz";
        sha512 = "7Q1Ncu0urALI6dPTrEbSTd//UK0qjRBeaxhnm8uY5fgYNFYAG+u4gtnTIo59S6Bw5P++4H3DiIDYoQdY/lha8w==";
      };
    };
    "@cspell/dict-node-5.0.8" = {
      name = "_at_cspell_slash_dict-node";
      packageName = "@cspell/dict-node";
      version = "5.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-node/-/dict-node-5.0.8.tgz";
        sha512 = "AirZcN2i84ynev3p2/1NCPEhnNsHKMz9zciTngGoqpdItUb2bDt1nJBjwlsrFI78GZRph/VaqTVFwYikmncpXg==";
      };
    };
    "@cspell/dict-npm-5.2.13" = {
      name = "_at_cspell_slash_dict-npm";
      packageName = "@cspell/dict-npm";
      version = "5.2.13";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-npm/-/dict-npm-5.2.13.tgz";
        sha512 = "yE7DfpiQjDFW6TLr5/fsSj4BlUy1A8lsuz2LQQHv4lQAAkZ4RsePYFL9DkRRfEtxn8CZYetUnU74/jQbfsnyrA==";
      };
    };
    "@cspell/dict-php-4.0.15" = {
      name = "_at_cspell_slash_dict-php";
      packageName = "@cspell/dict-php";
      version = "4.0.15";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-php/-/dict-php-4.0.15.tgz";
        sha512 = "iepGB2gtToMWSTvybesn4/lUp4LwXcEm0s8vasJLP76WWVkq1zYjmeS+WAIzNgsuURyZ/9mGqhS0CWMuo74ODw==";
      };
    };
    "@cspell/dict-powershell-5.0.15" = {
      name = "_at_cspell_slash_dict-powershell";
      packageName = "@cspell/dict-powershell";
      version = "5.0.15";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-powershell/-/dict-powershell-5.0.15.tgz";
        sha512 = "l4S5PAcvCFcVDMJShrYD0X6Huv9dcsQPlsVsBGbH38wvuN7gS7+GxZFAjTNxDmTY1wrNi1cCatSg6Pu2BW4rgg==";
      };
    };
    "@cspell/dict-public-licenses-2.0.14" = {
      name = "_at_cspell_slash_dict-public-licenses";
      packageName = "@cspell/dict-public-licenses";
      version = "2.0.14";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-public-licenses/-/dict-public-licenses-2.0.14.tgz";
        sha512 = "8NhNzQWALF6+NlLeKZKilSHbeW9MWeiD+NcrjehMAcovKFbsn8smmQG/bVxw+Ymtd6WEgNpLgswAqNsbSQQ4og==";
      };
    };
    "@cspell/dict-python-4.2.19" = {
      name = "_at_cspell_slash_dict-python";
      packageName = "@cspell/dict-python";
      version = "4.2.19";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-python/-/dict-python-4.2.19.tgz";
        sha512 = "9S2gTlgILp1eb6OJcVZeC8/Od83N8EqBSg5WHVpx97eMMJhifOzePkE0kDYjyHMtAFznCQTUu0iQEJohNQ5B0A==";
      };
    };
    "@cspell/dict-r-2.1.1" = {
      name = "_at_cspell_slash_dict-r";
      packageName = "@cspell/dict-r";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-r/-/dict-r-2.1.1.tgz";
        sha512 = "71Ka+yKfG4ZHEMEmDxc6+blFkeTTvgKbKAbwiwQAuKl3zpqs1Y0vUtwW2N4b3LgmSPhV3ODVY0y4m5ofqDuKMw==";
      };
    };
    "@cspell/dict-ruby-5.0.9" = {
      name = "_at_cspell_slash_dict-ruby";
      packageName = "@cspell/dict-ruby";
      version = "5.0.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-ruby/-/dict-ruby-5.0.9.tgz";
        sha512 = "H2vMcERMcANvQshAdrVx0XoWaNX8zmmiQN11dZZTQAZaNJ0xatdJoSqY8C8uhEMW89bfgpN+NQgGuDXW2vmXEw==";
      };
    };
    "@cspell/dict-rust-4.0.12" = {
      name = "_at_cspell_slash_dict-rust";
      packageName = "@cspell/dict-rust";
      version = "4.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-rust/-/dict-rust-4.0.12.tgz";
        sha512 = "z2QiH+q9UlNhobBJArvILRxV8Jz0pKIK7gqu4TgmEYyjiu1TvnGZ1tbYHeu9w3I/wOP6UMDoCBTty5AlYfW0mw==";
      };
    };
    "@cspell/dict-scala-5.0.8" = {
      name = "_at_cspell_slash_dict-scala";
      packageName = "@cspell/dict-scala";
      version = "5.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-scala/-/dict-scala-5.0.8.tgz";
        sha512 = "YdftVmumv8IZq9zu1gn2U7A4bfM2yj9Vaupydotyjuc+EEZZSqAafTpvW/jKLWji2TgybM1L2IhmV0s/Iv9BTw==";
      };
    };
    "@cspell/dict-shell-1.1.1" = {
      name = "_at_cspell_slash_dict-shell";
      packageName = "@cspell/dict-shell";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-shell/-/dict-shell-1.1.1.tgz";
        sha512 = "T37oYxE7OV1x/1D4/13Y8JZGa1QgDCXV7AVt3HLXjn0Fe3TaNDvf5sU0fGnXKmBPqFFrHdpD3uutAQb1dlp15g==";
      };
    };
    "@cspell/dict-software-terms-5.1.5" = {
      name = "_at_cspell_slash_dict-software-terms";
      packageName = "@cspell/dict-software-terms";
      version = "5.1.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-software-terms/-/dict-software-terms-5.1.5.tgz";
        sha512 = "MX5beBP3pLmIM0mjqfrHbie3EEfyLWZ8ZqW56jcLuRlLoDcfC0FZsr66NCARgCgEwsWiidHFe87+7fFsnwqY6A==";
      };
    };
    "@cspell/dict-sql-2.2.1" = {
      name = "_at_cspell_slash_dict-sql";
      packageName = "@cspell/dict-sql";
      version = "2.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-sql/-/dict-sql-2.2.1.tgz";
        sha512 = "qDHF8MpAYCf4pWU8NKbnVGzkoxMNrFqBHyG/dgrlic5EQiKANCLELYtGlX5auIMDLmTf1inA0eNtv74tyRJ/vg==";
      };
    };
    "@cspell/dict-svelte-1.0.7" = {
      name = "_at_cspell_slash_dict-svelte";
      packageName = "@cspell/dict-svelte";
      version = "1.0.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-svelte/-/dict-svelte-1.0.7.tgz";
        sha512 = "hGZsGqP0WdzKkdpeVLBivRuSNzOTvN036EBmpOwxH+FTY2DuUH7ecW+cSaMwOgmq5JFSdTcbTNFlNC8HN8lhaQ==";
      };
    };
    "@cspell/dict-swift-2.0.6" = {
      name = "_at_cspell_slash_dict-swift";
      packageName = "@cspell/dict-swift";
      version = "2.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-swift/-/dict-swift-2.0.6.tgz";
        sha512 = "PnpNbrIbex2aqU1kMgwEKvCzgbkHtj3dlFLPMqW1vSniop7YxaDTtvTUO4zA++ugYAEL+UK8vYrBwDPTjjvSnA==";
      };
    };
    "@cspell/dict-terraform-1.1.3" = {
      name = "_at_cspell_slash_dict-terraform";
      packageName = "@cspell/dict-terraform";
      version = "1.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-terraform/-/dict-terraform-1.1.3.tgz";
        sha512 = "gr6wxCydwSFyyBKhBA2xkENXtVFToheqYYGFvlMZXWjviynXmh+NK/JTvTCk/VHk3+lzbO9EEQKee6VjrAUSbA==";
      };
    };
    "@cspell/dict-typescript-3.2.3" = {
      name = "_at_cspell_slash_dict-typescript";
      packageName = "@cspell/dict-typescript";
      version = "3.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-typescript/-/dict-typescript-3.2.3.tgz";
        sha512 = "zXh1wYsNljQZfWWdSPYwQhpwiuW0KPW1dSd8idjMRvSD0aSvWWHoWlrMsmZeRl4qM4QCEAjua8+cjflm41cQBg==";
      };
    };
    "@cspell/dict-vue-3.0.5" = {
      name = "_at_cspell_slash_dict-vue";
      packageName = "@cspell/dict-vue";
      version = "3.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dict-vue/-/dict-vue-3.0.5.tgz";
        sha512 = "Mqutb8jbM+kIcywuPQCCaK5qQHTdaByoEO2J9LKFy3sqAdiBogNkrplqUK0HyyRFgCfbJUgjz3N85iCMcWH0JA==";
      };
    };
    "@cspell/dynamic-import-8.19.4" = {
      name = "_at_cspell_slash_dynamic-import";
      packageName = "@cspell/dynamic-import";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/dynamic-import/-/dynamic-import-8.19.4.tgz";
        sha512 = "0LLghC64+SiwQS20Sa0VfFUBPVia1rNyo0bYeIDoB34AA3qwguDBVJJkthkpmaP1R2JeR/VmxmJowuARc4ZUxA==";
      };
    };
    "@cspell/filetypes-8.19.4" = {
      name = "_at_cspell_slash_filetypes";
      packageName = "@cspell/filetypes";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/filetypes/-/filetypes-8.19.4.tgz";
        sha512 = "D9hOCMyfKtKjjqQJB8F80PWsjCZhVGCGUMiDoQpcta0e+Zl8vHgzwaC0Ai4QUGBhwYEawHGiWUd7Y05u/WXiNQ==";
      };
    };
    "@cspell/strong-weak-map-8.19.4" = {
      name = "_at_cspell_slash_strong-weak-map";
      packageName = "@cspell/strong-weak-map";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/strong-weak-map/-/strong-weak-map-8.19.4.tgz";
        sha512 = "MUfFaYD8YqVe32SQaYLI24/bNzaoyhdBIFY5pVrvMo1ZCvMl8AlfI2OcBXvcGb5aS5z7sCNCJm11UuoYbLI1zw==";
      };
    };
    "@cspell/url-8.19.4" = {
      name = "_at_cspell_slash_url";
      packageName = "@cspell/url";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@cspell/url/-/url-8.19.4.tgz";
        sha512 = "Pa474iBxS+lxsAL4XkETPGIq3EgMLCEb9agj3hAd2VGMTCApaiUvamR4b+uGXIPybN70piFxvzrfoxsG2uIP6A==";
      };
    };
    "@types/command-line-args-5.2.3" = {
      name = "_at_types_slash_command-line-args";
      packageName = "@types/command-line-args";
      version = "5.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/command-line-args/-/command-line-args-5.2.3.tgz";
        sha512 = "uv0aG6R0Y8WHZLTamZwtfsDLVRnOa+n+n5rEvFWL5Na5gZ8V2Teab/duDPFzIIIhs9qizDpcavCusCLJZu62Kw==";
      };
    };
    "@vlabo/cspell-lsp-1.1.5" = {
      name = "_at_vlabo_slash_cspell-lsp";
      packageName = "@vlabo/cspell-lsp";
      version = "1.1.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@vlabo/cspell-lsp/-/cspell-lsp-1.1.5.tgz";
        sha512 = "3el+IR9zcKo3J7iawuan/npoDcZ0LMRYyWctOGIbmjuHb5i4VsRx0cdqRySxXC4XYz3HJruaokNXMGElQws5oQ==";
      };
    };
    "ansi-escape-sequences-6.2.4" = {
      name = "ansi-escape-sequences";
      packageName = "ansi-escape-sequences";
      version = "6.2.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-escape-sequences/-/ansi-escape-sequences-6.2.4.tgz";
        sha512 = "2KJQAG1Nk4Iyu0dJENKXQJE9smEASrpu/E0F7LSnR72tQXngKGLqfRkHbkinjNct5vvAQY4BwQNt+4Tvg73nDQ==";
      };
    };
    "array-back-6.2.2" = {
      name = "array-back";
      packageName = "array-back";
      version = "6.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/array-back/-/array-back-6.2.2.tgz";
        sha512 = "gUAZ7HPyb4SJczXAMUXMGAvI976JoK3qEx9v1FTmeYuJj0IBiaKttG1ydtGKdkfqWkIkouke7nG8ufGy77+Cvw==";
      };
    };
    "array-timsort-1.0.3" = {
      name = "array-timsort";
      packageName = "array-timsort";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/array-timsort/-/array-timsort-1.0.3.tgz";
        sha512 = "/+3GRL7dDAGEfM6TseQk/U+mi18TU2Ms9I3UlLdUMhz2hbvGNTKdj9xniwXfUqgYhHxRx0+8UnKkvlNwVU+cWQ==";
      };
    };
    "callsites-3.1.0" = {
      name = "callsites";
      packageName = "callsites";
      version = "3.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/callsites/-/callsites-3.1.0.tgz";
        sha512 = "P8BjAsXvZS+VIDUI11hHCQEv74YT67YUi5JJFNWIqL235sBmjX4+qx9Muvls5ivyNENctx46xQLQ3aTuE7ssaQ==";
      };
    };
    "clear-module-4.1.2" = {
      name = "clear-module";
      packageName = "clear-module";
      version = "4.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/clear-module/-/clear-module-4.1.2.tgz";
        sha512 = "LWAxzHqdHsAZlPlEyJ2Poz6AIs384mPeqLVCru2p0BrP9G/kVGuhNyZYClLO6cXlnuJjzC8xtsJIuMjKqLXoAw==";
      };
    };
    "command-line-args-6.0.1" = {
      name = "command-line-args";
      packageName = "command-line-args";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/command-line-args/-/command-line-args-6.0.1.tgz";
        sha512 = "Jr3eByUjqyK0qd8W0SGFW1nZwqCaNCtbXjRo2cRJC1OYxWl3MZ5t1US3jq+cO4sPavqgw4l9BMGX0CBe+trepg==";
      };
    };
    "comment-json-4.2.5" = {
      name = "comment-json";
      packageName = "comment-json";
      version = "4.2.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/comment-json/-/comment-json-4.2.5.tgz";
        sha512 = "bKw/r35jR3HGt5PEPm1ljsQQGyCrR8sFGNiN5L+ykDHdpO8Smxkrkla9Yi6NkQyUrb8V54PGhfMs6NrIwtxtdw==";
      };
    };
    "core-util-is-1.0.3" = {
      name = "core-util-is";
      packageName = "core-util-is";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.3.tgz";
        sha512 = "ZQBvi1DcpJ4GDqanjucZ2Hj3wEO5pZDS89BWbkcrvdxksJorwUDDZamX9ldFkp9aw2lmBDLgkObEA4DWNJ9FYQ==";
      };
    };
    "cspell-config-lib-8.19.4" = {
      name = "cspell-config-lib";
      packageName = "cspell-config-lib";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cspell-config-lib/-/cspell-config-lib-8.19.4.tgz";
        sha512 = "LtFNZEWVrnpjiTNgEDsVN05UqhhJ1iA0HnTv4jsascPehlaUYVoyucgNbFeRs6UMaClJnqR0qT9lnPX+KO1OLg==";
      };
    };
    "cspell-dictionary-8.19.4" = {
      name = "cspell-dictionary";
      packageName = "cspell-dictionary";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cspell-dictionary/-/cspell-dictionary-8.19.4.tgz";
        sha512 = "lr8uIm7Wub8ToRXO9f6f7in429P1Egm3I+Ps3ZGfWpwLTCUBnHvJdNF/kQqF7PL0Lw6acXcjVWFYT7l2Wdst2g==";
      };
    };
    "cspell-glob-8.19.4" = {
      name = "cspell-glob";
      packageName = "cspell-glob";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cspell-glob/-/cspell-glob-8.19.4.tgz";
        sha512 = "042uDU+RjAz882w+DXKuYxI2rrgVPfRQDYvIQvUrY1hexH4sHbne78+OMlFjjzOCEAgyjnm1ktWUCCmh08pQUw==";
      };
    };
    "cspell-grammar-8.19.4" = {
      name = "cspell-grammar";
      packageName = "cspell-grammar";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cspell-grammar/-/cspell-grammar-8.19.4.tgz";
        sha512 = "lzWgZYTu/L7DNOHjxuKf8H7DCXvraHMKxtFObf8bAzgT+aBmey5fW2LviXUkZ2Lb2R0qQY+TJ5VIGoEjNf55ow==";
      };
    };
    "cspell-io-8.19.4" = {
      name = "cspell-io";
      packageName = "cspell-io";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cspell-io/-/cspell-io-8.19.4.tgz";
        sha512 = "W48egJqZ2saEhPWf5ftyighvm4mztxEOi45ILsKgFikXcWFs0H0/hLwqVFeDurgELSzprr12b6dXsr67dV8amg==";
      };
    };
    "cspell-lib-8.19.4" = {
      name = "cspell-lib";
      packageName = "cspell-lib";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cspell-lib/-/cspell-lib-8.19.4.tgz";
        sha512 = "NwfdCCYtIBNQuZcoMlMmL3HSv2olXNErMi/aOTI9BBAjvCHjhgX5hbHySMZ0NFNynnN+Mlbu5kooJ5asZeB3KA==";
      };
    };
    "cspell-trie-lib-8.19.4" = {
      name = "cspell-trie-lib";
      packageName = "cspell-trie-lib";
      version = "8.19.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cspell-trie-lib/-/cspell-trie-lib-8.19.4.tgz";
        sha512 = "yIPlmGSP3tT3j8Nmu+7CNpkPh/gBO2ovdnqNmZV+LNtQmVxqFd2fH7XvR1TKjQyctSH1ip0P5uIdJmzY1uhaYg==";
      };
    };
    "env-paths-3.0.0" = {
      name = "env-paths";
      packageName = "env-paths";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/env-paths/-/env-paths-3.0.0.tgz";
        sha512 = "dtJUTepzMW3Lm/NPxRf3wP4642UWhjL2sQxc+ym2YMj1m/H2zDNQOlezafzkHwn6sMstjHTwG6iQQsctDW/b1A==";
      };
    };
    "esprima-4.0.1" = {
      name = "esprima";
      packageName = "esprima";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz";
        sha512 = "eGuFFw7Upda+g4p+QHvnW0RyTX/SVeJBDM/gCtMARO0cLuT2HcEKnTPvhjV6aGeqrCB/sbNop0Kszm0jsaWU4A==";
      };
    };
    "fast-equals-5.2.2" = {
      name = "fast-equals";
      packageName = "fast-equals";
      version = "5.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-equals/-/fast-equals-5.2.2.tgz";
        sha512 = "V7/RktU11J3I36Nwq2JnZEM7tNm17eBJz+u25qdxBZeCKiX6BkVSZQjwWIr+IobgnZy+ag73tTZgZi7tr0LrBw==";
      };
    };
    "find-replace-5.0.2" = {
      name = "find-replace";
      packageName = "find-replace";
      version = "5.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/find-replace/-/find-replace-5.0.2.tgz";
        sha512 = "Y45BAiE3mz2QsrN2fb5QEtO4qb44NcS7en/0y9PEVsg351HsLeVclP8QPMH79Le9sH3rs5RSwJu99W0WPZO43Q==";
      };
    };
    "gensequence-7.0.0" = {
      name = "gensequence";
      packageName = "gensequence";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/gensequence/-/gensequence-7.0.0.tgz";
        sha512 = "47Frx13aZh01afHJTB3zTtKIlFI6vWY+MYCN9Qpew6i52rfKjnhCF/l1YlC8UmEMvvntZZ6z4PiCcmyuedR2aQ==";
      };
    };
    "global-directory-4.0.1" = {
      name = "global-directory";
      packageName = "global-directory";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/global-directory/-/global-directory-4.0.1.tgz";
        sha512 = "wHTUcDUoZ1H5/0iVqEudYW4/kAlN5cZ3j/bXn0Dpbizl9iaUVeWSHqiOjsgk6OW2bkLclbBjzewBz6weQ1zA2Q==";
      };
    };
    "has-own-prop-2.0.0" = {
      name = "has-own-prop";
      packageName = "has-own-prop";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-own-prop/-/has-own-prop-2.0.0.tgz";
        sha512 = "Pq0h+hvsVm6dDEa8x82GnLSYHOzNDt7f0ddFa3FqcQlgzEiptPqL+XrOJNavjOzSYiYWIrgeVYYgGlLmnxwilQ==";
      };
    };
    "import-fresh-3.3.1" = {
      name = "import-fresh";
      packageName = "import-fresh";
      version = "3.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/import-fresh/-/import-fresh-3.3.1.tgz";
        sha512 = "TR3KfrTZTYLPB6jUjfx6MF9WcWrHL9su5TObK4ZkYgBdWKPOFoSoQIdEuTuR82pmtxH2spWG9h6etwfr1pLBqQ==";
      };
    };
    "import-meta-resolve-4.1.0" = {
      name = "import-meta-resolve";
      packageName = "import-meta-resolve";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/import-meta-resolve/-/import-meta-resolve-4.1.0.tgz";
        sha512 = "I6fiaX09Xivtk+THaMfAwnA3MVA5Big1WHF1Dfx9hFuvNIWpXnorlkzhcQf6ehrqQiiZECRt1poOAkPmer3ruw==";
      };
    };
    "ini-4.1.1" = {
      name = "ini";
      packageName = "ini";
      version = "4.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ini/-/ini-4.1.1.tgz";
        sha512 = "QQnnxNyfvmHFIsj7gkPcYymR8Jdw/o7mp5ZFihxn6h8Ci6fh3Dx4E1gPjpQEpIuPo9XVNY/ZUwh4BPMjGyL01g==";
      };
    };
    "load-module-5.0.0" = {
      name = "load-module";
      packageName = "load-module";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/load-module/-/load-module-5.0.0.tgz";
        sha512 = "zZBnYIvAuP2TprnRisam+N/A3v+JX60pvdKoHQRKyl4xlHLQQLpp7JKNyEQ6D3Si0/QIQMgXko3PtV+cx6L7mA==";
      };
    };
    "lodash.camelcase-4.3.0" = {
      name = "lodash.camelcase";
      packageName = "lodash.camelcase";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash.camelcase/-/lodash.camelcase-4.3.0.tgz";
        sha512 = "TwuEnCnxbc3rAvhf/LbG7tJUDzhqXyFnv3dtzLOPgCG/hODL7WFnsbwktkD7yUV0RrreP/l1PALq/YSg6VvjlA==";
      };
    };
    "nature-0.7.0" = {
      name = "nature";
      packageName = "nature";
      version = "0.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/nature/-/nature-0.7.0.tgz";
        sha512 = "uPF5hJ7RRMa6I7P8ospuohv6VRFrxE5d1lWyR8Rvk7LI+U+fhVN0OQPQViAiGb8NYLem6gvKgS/XJjWhFCoNew==";
      };
    };
    "parent-module-1.0.1" = {
      name = "parent-module";
      packageName = "parent-module";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/parent-module/-/parent-module-1.0.1.tgz";
        sha512 = "GQ2EWRpQV8/o+Aw8YqtfZZPfNRWZYkbidE9k5rpl/hC3vtHHBfGm2Ifi6qWV+coDGkrUKZAxE3Lot5kcsRlh+g==";
      };
    };
    "parent-module-2.0.0" = {
      name = "parent-module";
      packageName = "parent-module";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/parent-module/-/parent-module-2.0.0.tgz";
        sha512 = "uo0Z9JJeWzv8BG+tRcapBKNJ0dro9cLyczGzulS6EfeyAdeC9sbojtW6XwvYxJkEne9En+J2XEl4zyglVeIwFg==";
      };
    };
    "picomatch-4.0.3" = {
      name = "picomatch";
      packageName = "picomatch";
      version = "4.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/picomatch/-/picomatch-4.0.3.tgz";
        sha512 = "5gTmgEY/sqK6gFXLIsQNH19lWb4ebPDLA4SdLP7dsWkIXHWlG66oPuVvXSGFPppYZz8ZDZq0dYYrbHfBCVUb1Q==";
      };
    };
    "repeat-string-1.6.1" = {
      name = "repeat-string";
      packageName = "repeat-string";
      version = "1.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/repeat-string/-/repeat-string-1.6.1.tgz";
        sha512 = "PV0dzCYDNfRi1jCDbJzpW7jNNDRuCOG/jI5ctQcGKt/clZD+YcPS3yIlWuTJMmESC8aevCFmWJy5wjAFgNqN6w==";
      };
    };
    "resolve-from-4.0.0" = {
      name = "resolve-from";
      packageName = "resolve-from";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/resolve-from/-/resolve-from-4.0.0.tgz";
        sha512 = "pb/MYmXstAkysRFx8piNI1tGFNQIFA3vkE3Gq4EuA1dF6gHp/+vgZqsCGJapvy8N3Q+4o7FwvquPJcnZ7RYy4g==";
      };
    };
    "resolve-from-5.0.0" = {
      name = "resolve-from";
      packageName = "resolve-from";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/resolve-from/-/resolve-from-5.0.0.tgz";
        sha512 = "qYg9KP24dD5qka9J47d0aVky0N+b4fTU89LN9iDnjB5waksiC49rvMB0PrUJQGoTmH50XPiqOvAjDfaijGxYZw==";
      };
    };
    "test-runner-0.12.0-8" = {
      name = "test-runner";
      packageName = "test-runner";
      version = "0.12.0-8";
      src = fetchurl {
        url = "https://registry.npmjs.org/test-runner/-/test-runner-0.12.0-8.tgz";
        sha512 = "yMpSYoThjimlpySwPMjhXr1e1MRbOStmITQgE07z9BokqlzW7vT2HhK1plQMVYN5wAxJGBcp8AjMmb9lzzBsZA==";
      };
    };
    "typical-7.3.0" = {
      name = "typical";
      packageName = "typical";
      version = "7.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/typical/-/typical-7.3.0.tgz";
        sha512 = "ya4mg/30vm+DOWfBg4YK3j2WD6TWtRkCbasOJr40CseYENzCUby/7rIvXA99JGsQHeNxLbnXdyLLxKSv3tauFw==";
      };
    };
    "vscode-jsonrpc-8.2.0" = {
      name = "vscode-jsonrpc";
      packageName = "vscode-jsonrpc";
      version = "8.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-jsonrpc/-/vscode-jsonrpc-8.2.0.tgz";
        sha512 = "C+r0eKJUIfiDIfwJhria30+TYWPtuHJXHtI7J0YlOmKAo7ogxP20T0zxB7HZQIFhIyvoBPwWskjxrvAtfjyZfA==";
      };
    };
    "vscode-languageserver-9.0.1" = {
      name = "vscode-languageserver";
      packageName = "vscode-languageserver";
      version = "9.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver/-/vscode-languageserver-9.0.1.tgz";
        sha512 = "woByF3PDpkHFUreUa7Hos7+pUWdeWMXRd26+ZX2A8cFx6v/JPTtd4/uN0/jB6XQHYaOlHbio03NTHCqrgG5n7g==";
      };
    };
    "vscode-languageserver-protocol-3.17.5" = {
      name = "vscode-languageserver-protocol";
      packageName = "vscode-languageserver-protocol";
      version = "3.17.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-protocol/-/vscode-languageserver-protocol-3.17.5.tgz";
        sha512 = "mb1bvRJN8SVznADSGWM9u/b07H7Ecg0I3OgXDuLdn307rl/J3A9YD6/eYOssqhecL27hK1IPZAsaqh00i/Jljg==";
      };
    };
    "vscode-languageserver-textdocument-1.0.12" = {
      name = "vscode-languageserver-textdocument";
      packageName = "vscode-languageserver-textdocument";
      version = "1.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-textdocument/-/vscode-languageserver-textdocument-1.0.12.tgz";
        sha512 = "cxWNPesCnQCcMPeenjKKsOCKQZ/L6Tv19DTRIGuLWe32lyzWhihGVJ/rcckZXJxfdKCFvRLS3fpBIsV/ZGX4zA==";
      };
    };
    "vscode-languageserver-types-3.17.5" = {
      name = "vscode-languageserver-types";
      packageName = "vscode-languageserver-types";
      version = "3.17.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-types/-/vscode-languageserver-types-3.17.5.tgz";
        sha512 = "Ld1VelNuX9pdF39h2Hgaeb5hEZM2Z3jUrrMgWQAu82jMtZp7p3vJT3BzToKtZI7NgQssZje5o0zryOrhQvzQAg==";
      };
    };
    "vscode-uri-3.1.0" = {
      name = "vscode-uri";
      packageName = "vscode-uri";
      version = "3.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-uri/-/vscode-uri-3.1.0.tgz";
        sha512 = "/BpdSx+yCQGnCvecbyXdxHDkuk55/G3xwnC0GqY4gmQ3j+A+g8kzzgB4Nk/SINjqn6+waqw3EgbVF2QKExkRxQ==";
      };
    };
    "xdg-basedir-5.1.0" = {
      name = "xdg-basedir";
      packageName = "xdg-basedir";
      version = "5.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/xdg-basedir/-/xdg-basedir-5.1.0.tgz";
        sha512 = "GCPAHLvrIH13+c0SuacwvRYj2SxJXQ4kaVTT5xgL3kPrz56XxkF21IGhjSE1+W0aw7gpBWRGXLCPnPby6lSpmQ==";
      };
    };
    "yaml-2.8.1" = {
      name = "yaml";
      packageName = "yaml";
      version = "2.8.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/yaml/-/yaml-2.8.1.tgz";
        sha512 = "lcYcMxX2PO9XMGvAJkJ3OsNMw+/7FKes7/hgerGUYWIoWu5j/+YQqcZr5JnPZWzOsEBgMbSbiSTn/dv/69Mkpw==";
      };
    };
  };
in
nodeEnv.buildNodePackage {
  name = "_at_vlabo_slash_cspell-lsp";
  packageName = "@vlabo/cspell-lsp";
  version = "1.1.5";
  src = fetchurl {
    url = "https://registry.npmjs.org/@vlabo/cspell-lsp/-/cspell-lsp-1.1.5.tgz";
    sha512 = "3el+IR9zcKo3J7iawuan/npoDcZ0LMRYyWctOGIbmjuHb5i4VsRx0cdqRySxXC4XYz3HJruaokNXMGElQws5oQ==";
  };
  dependencies = [
    sources."@75lb/nature-0.1.10"
    sources."@cspell/cspell-bundled-dicts-8.19.4"
    sources."@cspell/cspell-pipe-8.19.4"
    sources."@cspell/cspell-resolver-8.19.4"
    sources."@cspell/cspell-service-bus-8.19.4"
    sources."@cspell/cspell-types-8.19.4"
    sources."@cspell/dict-ada-4.1.1"
    sources."@cspell/dict-al-1.1.1"
    sources."@cspell/dict-aws-4.0.14"
    sources."@cspell/dict-bash-4.2.1"
    sources."@cspell/dict-companies-3.2.3"
    sources."@cspell/dict-cpp-6.0.9"
    sources."@cspell/dict-cryptocurrencies-5.0.5"
    sources."@cspell/dict-csharp-4.0.7"
    sources."@cspell/dict-css-4.0.18"
    sources."@cspell/dict-dart-2.3.1"
    sources."@cspell/dict-data-science-2.0.9"
    sources."@cspell/dict-django-4.1.5"
    sources."@cspell/dict-docker-1.1.16"
    sources."@cspell/dict-dotnet-5.0.10"
    sources."@cspell/dict-elixir-4.0.8"
    sources."@cspell/dict-en-common-misspellings-2.1.3"
    sources."@cspell/dict-en-gb-1.1.33"
    sources."@cspell/dict-en_us-4.4.16"
    sources."@cspell/dict-filetypes-3.0.13"
    sources."@cspell/dict-flutter-1.1.1"
    sources."@cspell/dict-fonts-4.0.5"
    sources."@cspell/dict-fsharp-1.1.1"
    sources."@cspell/dict-fullstack-3.2.7"
    sources."@cspell/dict-gaming-terms-1.1.2"
    sources."@cspell/dict-git-3.0.7"
    sources."@cspell/dict-golang-6.0.23"
    sources."@cspell/dict-google-1.0.9"
    sources."@cspell/dict-haskell-4.0.6"
    sources."@cspell/dict-html-4.0.12"
    sources."@cspell/dict-html-symbol-entities-4.0.4"
    sources."@cspell/dict-java-5.0.12"
    sources."@cspell/dict-julia-1.1.1"
    sources."@cspell/dict-k8s-1.0.12"
    sources."@cspell/dict-kotlin-1.1.1"
    sources."@cspell/dict-latex-4.0.4"
    sources."@cspell/dict-lorem-ipsum-4.0.5"
    sources."@cspell/dict-lua-4.0.8"
    sources."@cspell/dict-makefile-1.0.5"
    sources."@cspell/dict-markdown-2.0.12"
    sources."@cspell/dict-monkeyc-1.0.11"
    sources."@cspell/dict-node-5.0.8"
    sources."@cspell/dict-npm-5.2.13"
    sources."@cspell/dict-php-4.0.15"
    sources."@cspell/dict-powershell-5.0.15"
    sources."@cspell/dict-public-licenses-2.0.14"
    sources."@cspell/dict-python-4.2.19"
    sources."@cspell/dict-r-2.1.1"
    sources."@cspell/dict-ruby-5.0.9"
    sources."@cspell/dict-rust-4.0.12"
    sources."@cspell/dict-scala-5.0.8"
    sources."@cspell/dict-shell-1.1.1"
    sources."@cspell/dict-software-terms-5.1.5"
    sources."@cspell/dict-sql-2.2.1"
    sources."@cspell/dict-svelte-1.0.7"
    sources."@cspell/dict-swift-2.0.6"
    sources."@cspell/dict-terraform-1.1.3"
    sources."@cspell/dict-typescript-3.2.3"
    sources."@cspell/dict-vue-3.0.5"
    sources."@cspell/dynamic-import-8.19.4"
    sources."@cspell/filetypes-8.19.4"
    sources."@cspell/strong-weak-map-8.19.4"
    sources."@cspell/url-8.19.4"
    sources."@types/command-line-args-5.2.3"
    sources."@vlabo/cspell-lsp-1.1.5"
    (
      sources."ansi-escape-sequences-6.2.4"
      // {
        dependencies = [
          sources."@75lb/nature-0.1.10"
        ];
      }
    )
    sources."array-back-6.2.2"
    sources."array-timsort-1.0.3"
    sources."callsites-3.1.0"
    sources."clear-module-4.1.2"
    sources."command-line-args-6.0.1"
    sources."comment-json-4.2.5"
    sources."core-util-is-1.0.3"
    sources."cspell-config-lib-8.19.4"
    sources."cspell-dictionary-8.19.4"
    sources."cspell-glob-8.19.4"
    sources."cspell-grammar-8.19.4"
    sources."cspell-io-8.19.4"
    sources."cspell-lib-8.19.4"
    sources."cspell-trie-lib-8.19.4"
    sources."env-paths-3.0.0"
    sources."esprima-4.0.1"
    sources."fast-equals-5.2.2"
    (
      sources."find-replace-5.0.2"
      // {
        dependencies = [
          sources."@75lb/nature-0.1.10"
        ];
      }
    )
    sources."gensequence-7.0.0"
    sources."global-directory-4.0.1"
    sources."has-own-prop-2.0.0"
    (
      sources."import-fresh-3.3.1"
      // {
        dependencies = [
          sources."parent-module-1.0.1"
          sources."resolve-from-4.0.0"
        ];
      }
    )
    sources."import-meta-resolve-4.1.0"
    sources."ini-4.1.1"
    sources."load-module-5.0.0"
    sources."lodash.camelcase-4.3.0"
    sources."nature-0.7.0"
    sources."parent-module-2.0.0"
    sources."picomatch-4.0.3"
    sources."repeat-string-1.6.1"
    sources."resolve-from-5.0.0"
    sources."test-runner-0.12.0-8"
    sources."typical-7.3.0"
    sources."vscode-jsonrpc-8.2.0"
    sources."vscode-languageserver-9.0.1"
    sources."vscode-languageserver-protocol-3.17.5"
    sources."vscode-languageserver-textdocument-1.0.12"
    sources."vscode-languageserver-types-3.17.5"
    sources."vscode-uri-3.1.0"
    sources."xdg-basedir-5.1.0"
    sources."yaml-2.8.1"
  ];
  buildInputs = globalBuildInputs;
  meta = {
    description = "This extension performs spell checking in source code files, using the [cspell library](https://cspell.org/).";
    homepage = "https://github.com/vlabo/cspell-lsp";
    license = "GPL-3.0-only";
  };
  production = true;
  bypassCache = true;
  reconstructLock = true;
}
