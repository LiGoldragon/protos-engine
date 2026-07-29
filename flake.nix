{
  description = "Pinned integration checks for the Protos micro-repository family";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/91cc1fdf6831e29b6c98768e721a72241f3d0797";

    content-identity = {
      url = "github:LiGoldragon/content-identity/f1f9c6efc828acaefd0f751550cd40389d312bf5";
    };
    core-ethos.url = "github:LiGoldragon/core-ethos/b9db643a853b1f52f10a4100a791d5dbc8c7240d";
    core-logos.url = "github:LiGoldragon/core-logos/ffb9ccdeac94b4e3401fc4bffa593589f0321fe5";
    core-nomos.url = "github:LiGoldragon/core-nomos/c185f6168474a7d94da970d95a15a149ec7b9220";
    name-table = {
      url = "github:LiGoldragon/name-table/1f558eac44bd03034e51ad98e3a65ec16d8b8411";
    };
    raw-discovery = {
      url = "github:LiGoldragon/raw-discovery/c27a9efabb1981c8b3d887c870fff82fc7daf49c";
      flake = false;
    };
    structural-codec = {
      url = "github:LiGoldragon/structural-codec/38c037d83ad4a1a275295442e2978a8130d0ae4c";
      flake = false;
    };
    protos.url = "github:LiGoldragon/protos/1435c9aeb7f24e811aca670101e355ff26818ae2";
    sema-translator.url = "github:LiGoldragon/sema-translator/bcfb339b069d3eba756779105894b396b7a8acc6";
    signal-sema-translator.url = "github:LiGoldragon/signal-sema-translator/8ff7d0db033c756a0cd7999e72e564ca1c32b4aa";
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
    textual-rust.url = "github:LiGoldragon/textual-rust/87a9d9c29403e5ff2e08f4d18d034b11cc30be1b";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      content-identity,
      core-ethos,
      core-logos,
      core-nomos,
      name-table,
      raw-discovery,
      structural-codec,
      protos,
      sema-translator,
      signal-sema-translator,
      schema-language,
      schema-rust,
      signal-spirit,
      meta-signal-spirit,
      spirit,
      textual-rust,
    }:
    let
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];
      forAllSystems = function: nixpkgs.lib.genAttrs systems (system: function system);
      familyInputs = builtins.removeAttrs inputs [
        "nixpkgs"
        "self"
      ];
      familySourceMap = builtins.toFile "protos-engine-root-family-sources.json" (
        builtins.toJSON (builtins.mapAttrs (_name: source: toString source.outPath) familyInputs)
      );
    in
    {
      checks = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
          scriptInputs = [
            pkgs.bash
            pkgs.coreutils
            pkgs.diffutils
            pkgs.findutils
            pkgs.gnugrep
            pkgs.gnused
            pkgs.jq
            pkgs.ripgrep
          ];
          repositoryShape =
            pkgs.runCommand "protos-engine-repository-shape"
              {
                nativeBuildInputs = scriptInputs;
              }
              ''
                bash ${./scripts/check-repository-shape} ${self}
                bash ${./scripts/check-repository-shape} --self-test
                touch "$out"
              '';
          exactPins =
            pkgs.runCommand "protos-engine-exact-pins"
              {
                nativeBuildInputs = scriptInputs;
              }
              ''
                bash ${./scripts/check-pin-policy} \
                  --lock-only ${self}/flake.lock
                bash ${./scripts/check-pin-policy} \
                  --lock-self-test ${self}/flake.lock
                touch "$out"
              '';
          dependencyDirection =
            pkgs.runCommand "protos-engine-dependency-direction"
              {
                nativeBuildInputs = scriptInputs;
                validatedPinPolicy = exactPins;
              }
              ''
                test -e "$validatedPinPolicy"
                bash ${./scripts/check-dependency-direction} \
                  ${self} ${self}/flake.lock ${familySourceMap}
                bash ${./scripts/check-dependency-direction} \
                  --self-test ${self} ${self}/flake.lock ${familySourceMap}
                touch "$out"
              '';
          identityCapsuleCoherence =
            pkgs.runCommand "protos-engine-identity-capsule-coherence"
              {
                nativeBuildInputs = scriptInputs;
                validatedPinPolicy = exactPins;
              }
              ''
                test -e "$validatedPinPolicy"
                bash ${./scripts/check-identity-capsule-coherence} \
                  ${self}/flake.lock ${familySourceMap}
                bash ${./scripts/check-identity-capsule-coherence} \
                  --self-test ${self}/flake.lock ${familySourceMap}
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
                bash ${./scripts/check-public-text-search-witness} \
                  --self-test ${signal-spirit} ${spirit}
                touch "$out"
              '';
          publicTextSearchExactTest = spirit.checks.${system}.test-nota-text.overrideAttrs (_previous: {
            name = "spirit-public-text-search-exact-test";
            pname = "spirit-public-text-search-exact-test";
            doInstallCargoArtifacts = false;
            checkPhase = ''
              runHook preCheck
              set -o pipefail
              cargoWithProfile test \
                --features nota-text \
                --test process_boundary \
                public_text_search_returns_direct_ranked_records \
                -- --exact 2>&1 | tee exact-test.log
              grep -F \
                "test public_text_search_returns_direct_ranked_records ... ok" \
                exact-test.log
              grep -F \
                "test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured;" \
                exact-test.log
              runHook postCheck
            '';
            installPhase = ''
              runHook preInstall
              mkdir -p "$out"
              printf '%s\n' \
                "process_boundary::public_text_search_returns_direct_ranked_records passed" \
                > "$out/witness"
              runHook postInstall
            '';
          });
          shellScripts =
            pkgs.runCommand "protos-engine-shell-scripts"
              {
                nativeBuildInputs = [ pkgs.shellcheck ];
              }
              ''
                shellcheck ${./scripts}/*
                touch "$out"
              '';
          identityCapsuleProducerChecks =
            if system == "x86_64-linux" then
              {
                content-identity-test = content-identity.checks.${system}.test;
                name-table-test = name-table.checks.${system}.test;
                signal-sema-translator-test = signal-sema-translator.checks.${system}.test;
                sema-translator-test = sema-translator.checks.${system}.test;
                sema-translator-process = sema-translator.checks.${system}.process;
                protos-test = protos.checks.${system}.test;
                protos-package-contents = protos.checks.${system}.package-contents;
                core-ethos-test = core-ethos.checks.${system}.test;
                core-logos-test = core-logos.checks.${system}.test;
                textual-rust-test = textual-rust.checks.${system}.test;
                core-nomos-test = core-nomos.checks.${system}.test;
              }
            else
              { };
        in
        {
          repository-shape = repositoryShape;
          exact-pins = exactPins;
          dependency-direction = dependencyDirection;
          identity-capsule-coherence = identityCapsuleCoherence;
          public-text-search-witness-contract = publicTextSearchWitnessContract;
          public-text-search-exact-test = publicTextSearchExactTest;
          shell-scripts = shellScripts;
          public-text-search-owner-suite = spirit.checks.${system}.test-nota-text;
        }
        // identityCapsuleProducerChecks
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
              export PROTOS_ENGINE_FLAKE_REFERENCE=${self}
              ${builtins.readFile ./scripts/run-public-text-search-witness}
            '';
          };
          checkAllRunner = pkgs.writeShellApplication {
            name = "protos-engine-check-all";
            runtimeInputs = [
              pkgs.coreutils
              pkgs.gnused
              pkgs.jq
              pkgs.jujutsu
              pkgs.nix
            ];
            text = ''
              repository_root="''${PROTOS_ENGINE_REPOSITORY_ROOT:-${self}}"
              bash ${./scripts/check-pin-policy} "$repository_root"
              bash ${./scripts/check-pin-policy} --self-test "$repository_root"
              nix flake check --print-build-logs "path:$repository_root"
            '';
          };
        in
        {
          check-all = {
            type = "app";
            program = "${checkAllRunner}/bin/protos-engine-check-all";
            meta.description = "Run live metadata policy, mutations, and all pure flake checks";
          };
          public-text-search-witness = {
            type = "app";
            program = "${runner}/bin/protos-engine-public-text-search-witness";
            meta.description = "Run the exact pinned Spirit PublicTextSearch process witness";
          };
        }
      );
    };
}
