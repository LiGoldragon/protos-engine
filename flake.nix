{
  description = "Pinned integration checks for the Protos micro-repository family";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/91cc1fdf6831e29b6c98768e721a72241f3d0797";

    content-identity = {
      url = "github:LiGoldragon/content-identity/ac0075842799b3ece8909ad0eb4b8a92b596b188";
      flake = false;
    };
    name-table = {
      url = "github:LiGoldragon/name-table/a1705ef512efec28925ae3ffc9faa5a2aa4dc4a8";
      flake = false;
    };
    raw-discovery = {
      url = "github:LiGoldragon/raw-discovery/c27a9efabb1981c8b3d887c870fff82fc7daf49c";
      flake = false;
    };
    structural-codec = {
      url = "github:LiGoldragon/structural-codec/e5fa1b3bbdde13f3dac205920b16a2e73f3d4487";
      flake = false;
    };
    protos = {
      url = "github:LiGoldragon/protos/c6fa54c066a1210bbba026d9d761bb3ef5b8af5f";
      flake = false;
    };
    schema-language = {
      url = "github:LiGoldragon/schema-language/9c217610c4b8d3bdaa9f95542e28c04424a593e3";
      flake = false;
    };
    schema-rust = {
      url = "github:LiGoldragon/schema-rust/3721656b0a654d47d9abde31f14d89d01f9305cf";
      flake = false;
    };
    signal-spirit = {
      url = "github:LiGoldragon/signal-spirit/1cf7c010029de46369b742687da4fa1ca6def9a9";
      flake = false;
    };
    meta-signal-spirit = {
      url = "github:LiGoldragon/meta-signal-spirit/0a7a2438c8e5d57cb1fd413452d0a7ddad4fb9b3";
      flake = false;
    };
    spirit.url = "github:LiGoldragon/spirit/1049b8a1a9e3c2be7ece3553b89c7e3815939d43";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      content-identity,
      name-table,
      raw-discovery,
      structural-codec,
      protos,
      schema-language,
      schema-rust,
      signal-spirit,
      meta-signal-spirit,
      spirit,
    }:
    let
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      forAllSystems = function:
        nixpkgs.lib.genAttrs systems (system: function system);
    in
    {
      checks = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          scriptInputs = [
            pkgs.bash
            pkgs.coreutils
            pkgs.findutils
            pkgs.gnugrep
            pkgs.gnused
            pkgs.ripgrep
          ];
          repositoryShape = pkgs.runCommand "protos-engine-repository-shape" {
            nativeBuildInputs = scriptInputs;
          } ''
            bash ${./scripts/check-repository-shape} ${self}
            touch "$out"
          '';
          exactPins =
            assert nixpkgs.rev == "91cc1fdf6831e29b6c98768e721a72241f3d0797";
            assert content-identity.rev == "ac0075842799b3ece8909ad0eb4b8a92b596b188";
            assert name-table.rev == "a1705ef512efec28925ae3ffc9faa5a2aa4dc4a8";
            assert raw-discovery.rev == "c27a9efabb1981c8b3d887c870fff82fc7daf49c";
            assert structural-codec.rev == "e5fa1b3bbdde13f3dac205920b16a2e73f3d4487";
            assert protos.rev == "c6fa54c066a1210bbba026d9d761bb3ef5b8af5f";
            assert schema-language.rev == "9c217610c4b8d3bdaa9f95542e28c04424a593e3";
            assert schema-rust.rev == "3721656b0a654d47d9abde31f14d89d01f9305cf";
            assert signal-spirit.rev == "1cf7c010029de46369b742687da4fa1ca6def9a9";
            assert meta-signal-spirit.rev == "0a7a2438c8e5d57cb1fd413452d0a7ddad4fb9b3";
            assert spirit.rev == "1049b8a1a9e3c2be7ece3553b89c7e3815939d43";
            pkgs.runCommand "protos-engine-exact-pins" {
              nativeBuildInputs = scriptInputs;
            } ''
              bash ${./scripts/check-pin-policy} ${self}
              touch "$out"
            '';
          dependencyDirection = pkgs.runCommand "protos-engine-dependency-direction" {
            nativeBuildInputs = scriptInputs;
          } ''
            bash ${./scripts/check-dependency-direction} ${self} \
              "content-identity=${content-identity}" \
              "name-table=${name-table}" \
              "raw-discovery=${raw-discovery}" \
              "structural-codec=${structural-codec}" \
              "protos=${protos}" \
              "schema-language=${schema-language}" \
              "schema-rust=${schema-rust}" \
              "signal-spirit=${signal-spirit}" \
              "meta-signal-spirit=${meta-signal-spirit}" \
              "spirit=${spirit}"
            touch "$out"
          '';
          publicTextSearchWitnessContract =
            pkgs.runCommand "protos-engine-public-text-search-witness-contract"
              {
                nativeBuildInputs = scriptInputs;
              }
              ''
                bash ${./scripts/check-public-text-search-witness} \
                  ${signal-spirit} ${spirit}
                touch "$out"
              '';
          shellScripts = pkgs.runCommand "protos-engine-shell-scripts" {
            nativeBuildInputs = [ pkgs.shellcheck ];
          } ''
            shellcheck ${./scripts}/*
            touch "$out"
          '';
        in
        {
          repository-shape = repositoryShape;
          exact-pins = exactPins;
          dependency-direction = dependencyDirection;
          public-text-search-witness-contract = publicTextSearchWitnessContract;
          shell-scripts = shellScripts;
          public-text-search-owner-suite =
            spirit.checks.${system}.test-nota-text;
        }
      );

      apps = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          runner = pkgs.writeShellApplication {
            name = "protos-engine-public-text-search-witness";
            runtimeInputs = [
              pkgs.coreutils
              pkgs.nix
            ];
            text = ''
              export PROTOS_ENGINE_SPIRIT_SYSTEM=${system}
              ${builtins.readFile ./scripts/run-public-text-search-witness}
            '';
          };
        in
        {
          public-text-search-witness = {
            type = "app";
            program = "${runner}/bin/protos-engine-public-text-search-witness";
          };
        }
      );
    };
}
