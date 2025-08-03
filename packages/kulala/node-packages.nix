{
  nodeEnv,
  fetchurl,
  globalBuildInputs ? [ ],
}:

let
  sources = {
    "@mistweaverco/tree-sitter-graphql-1.9.0" = {
      name = "_at_mistweaverco_slash_tree-sitter-graphql";
      packageName = "@mistweaverco/tree-sitter-graphql";
      version = "1.9.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@mistweaverco/tree-sitter-graphql/-/tree-sitter-graphql-1.9.0.tgz";
        sha512 = "XauMg8wywQaP5/54eBy+pJO8MvUgInkHwSftSNosqyCeSsf0nQuPfdiKs4bb7EBO0kv6UPcN87WfZdf+NZ5pgg==";
      };
    };
    "@mistweaverco/tree-sitter-kulala-1.9.0" = {
      name = "_at_mistweaverco_slash_tree-sitter-kulala";
      packageName = "@mistweaverco/tree-sitter-kulala";
      version = "1.9.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@mistweaverco/tree-sitter-kulala/-/tree-sitter-kulala-1.9.0.tgz";
        sha512 = "4F+kCZFEvurSGrWM52lnowXBOqQ5+nfzxp55ufCqTdDSzSI92kySHmlhF7d2g/ZW4Jjrbromh1WH9XK/mHPbzQ==";
      };
    };
    "node-addon-api-8.1.0" = {
      name = "node-addon-api";
      packageName = "node-addon-api";
      version = "8.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-addon-api/-/node-addon-api-8.1.0.tgz";
        sha512 = "yBY+qqWSv3dWKGODD6OGE6GnTX7Q2r+4+DfpqxHSHh8x0B4EKP9+wVGLS6U/AM1vxSNNmUEuIV5EGhYwPpfOwQ==";
      };
    };
    "node-gyp-build-4.8.2" = {
      name = "node-gyp-build";
      packageName = "node-gyp-build";
      version = "4.8.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-gyp-build/-/node-gyp-build-4.8.2.tgz";
        sha512 = "IRUxE4BVsHWXkV/SFOut4qTlagw2aM8T5/vnTsmrHJvVoKueJHRc/JaFND7QDDc61kLYUJ6qlZM3sqTSyx2dTw==";
      };
    };
    "tree-sitter-0.21.1" = {
      name = "tree-sitter";
      packageName = "tree-sitter";
      version = "0.21.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tree-sitter/-/tree-sitter-0.21.1.tgz";
        sha512 = "7dxoA6kYvtgWw80265MyqJlkRl4yawIjO7S5MigytjELkX43fV2WsAXzsNfO7sBpPPCF5Gp0+XzHk0DwLCq3xQ==";
      };
    };
  };
in
nodeEnv.buildNodePackage {
  name = "_at_mistweaverco_slash_kulala-ls";
  packageName = "@mistweaverco/kulala-ls";
  version = "1.9.0";
  src = fetchurl {
    url = "https://registry.npmjs.org/@mistweaverco/kulala-ls/-/kulala-ls-1.9.0.tgz";
    sha512 = "X9gMkAagMAmPOWph4HS0OF998tzmGNdScfOyoWcySFolmhlVo084UIltRIeMwGt5dTVeCraEj9GabdZChZOhxg==";
  };
  dependencies = [
    sources."@mistweaverco/tree-sitter-graphql-1.9.0"
    sources."@mistweaverco/tree-sitter-kulala-1.9.0"
    sources."node-addon-api-8.1.0"
    sources."node-gyp-build-4.8.2"
    sources."tree-sitter-0.21.1"
  ];
  buildInputs = globalBuildInputs;
  meta = {
    description = "A minimal language server for HTTP syntax.";
    homepage = "https://github.com/mistweaverco/kulala-ls";
  };
  production = true;
  bypassCache = true;
  reconstructLock = true;
}
