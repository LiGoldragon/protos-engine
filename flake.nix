{
  description = "Pinned integration checks for the Protos micro-repository family";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/91cc1fdf6831e29b6c98768e721a72241f3d0797";

    content-identity = {
      url = "github:LiGoldragon/content-identity/fdf2db1d5a9e8ea52d24d39a03833c3e6885c355";
    };
    core-ethos.url = "github:LiGoldragon/core-ethos/0840dbd96d250b15b750b5b17a3a7c86bacfb7ee";
    core-logos.url = "github:LiGoldragon/core-logos/e4cefc413cfafbe589e64d961fba34457d214316";
    core-nomos.url = "github:LiGoldragon/core-nomos/55e72e3bd6de11325d6e4e7ea6dc29566bccc68d";
    language-engine-witness.url = "github:LiGoldragon/language-engine-witness/c6bb69e9ba9286994a386ec7a75f7aad4519fdb3";
    name-table = {
      url = "github:LiGoldragon/name-table/50cb4bb53ae2dc4f2516f6912be328ef98ae49f8";
    };
    raw-discovery = {
      url = "github:LiGoldragon/raw-discovery/7290f65bbb5e7825ab2ca58340631d154d69d110";
      flake = false;
    };
    structural-codec = {
      url = "github:LiGoldragon/structural-codec/31d2e4c14943802ce75a910edd54ea1796273f78";
      flake = false;
    };
    protos.url = "github:LiGoldragon/protos/1343d0c405cdb6929552ea6b12c48739e73f35ab";
    sema-translator.url = "github:LiGoldragon/sema-translator/7e9e85bb9d199f24b968bcd49a351e910469f5b5";
    signal-sema-translator.url = "github:LiGoldragon/signal-sema-translator/dd8e7b5656833f640e49c099ab3be6f09881f9c5";
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
    rust-logos.url = "github:LiGoldragon/rust-logos/c8e4ebc16dbea75880b3034a7c46cb6812ab4ef7";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      content-identity,
      core-ethos,
      core-logos,
      core-nomos,
      language-engine-witness,
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
      rust-logos,
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
          sliceOneCoherence =
            pkgs.runCommand "protos-engine-slice-one-coherence"
              {
                nativeBuildInputs = scriptInputs;
                validatedPinPolicy = exactPins;
              }
              ''
                test -e "$validatedPinPolicy"
                bash ${./scripts/check-slice-one-coherence} \
                  ${self}/flake.lock ${familySourceMap}
                bash ${./scripts/check-slice-one-coherence} \
                  --self-test ${self}/flake.lock ${familySourceMap}
                touch "$out"
              '';
          sliceOneBehaviorWitness =
            pkgs.runCommand "protos-engine-slice-one-behavior-witness"
              {
                validatedPinPolicy = exactPins;
                validatedDependencyDirection = dependencyDirection;
                validatedSliceOneCoherence = sliceOneCoherence;
                ownerWitness = language-engine-witness.checks.${system}.test;
                ownerSpiritDomainInventory =
                  language-engine-witness.checks.${system}.spirit-domain-inventory;
              }
              ''
                test -e "$validatedPinPolicy"
                test -e "$validatedDependencyDirection"
                test -e "$validatedSliceOneCoherence"
                test -e "$ownerWitness"
                test -e "$ownerSpiritDomainInventory"
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
                rust-logos-test = rust-logos.checks.${system}.test;
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
          slice-one-coherence = sliceOneCoherence;
          slice-one-behavior-witness = sliceOneBehaviorWitness;
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
