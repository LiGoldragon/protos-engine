{
  description = "Pinned integration checks for the Protos micro-repository family";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/91cc1fdf6831e29b6c98768e721a72241f3d0797";

    content-identity = {
      url = "github:LiGoldragon/content-identity/fdf2db1d5a9e8ea52d24d39a03833c3e6885c355";
    };
    capsule-content-identity = {
      url = "github:LiGoldragon/content-identity/896b21e17f31b66d0802bff899b4b60acea9c0f1";
    };
    core-ethos.url = "github:LiGoldragon/core-ethos/427fd74a8217f557cfabdfe0ff23b784c855bf85";
    core-logos.url = "github:LiGoldragon/core-logos/f3655c5ba60d2aec5a6bffa0962eef6b5964ee4e";
    core-nomos.url = "github:LiGoldragon/core-nomos/ff675b264e3650afb88291036ec2bdd97292a2e7";
    language-engine-witness.url = "github:LiGoldragon/language-engine-witness/9913d2dbd48b3153fb443f0c9b2123c693a75e11";
    legacy-protos.url = "github:LiGoldragon/protos/1343d0c405cdb6929552ea6b12c48739e73f35ab";
    name-table = {
      url = "github:LiGoldragon/name-table/a22f48d8040ab9235f3552ad8654ff8e27b8157d";
    };
    raw-discovery = {
      url = "github:LiGoldragon/raw-discovery/2d4e2e00f2821c4e2893fa96028cef0ac76e9644";
    };
    structural-codec = {
      url = "github:LiGoldragon/structural-codec/879d76f91facedd6d5cbca79e282260e1beb9478";
    };
    protos.url = "github:LiGoldragon/protos/65e7c6d4692a40e1c49deffb3fb4a9a2c3555c5b";
    nomos-protos.url = "github:LiGoldragon/protos/1263f9d1f73b57885d695ac033bdd6faa1334ddf";
    nomos-engine.url = "github:LiGoldragon/nomos-engine/07c71bd4350347a2205333aeb489b56443a034f8";
    sealed-core-nomos.url = "github:LiGoldragon/core-nomos/ba7abc0b471a0385012b1d8a03cf4942e9da617e";
    template-core-logos.url = "github:LiGoldragon/core-logos/141abe23273273d2e4470ce15b42ccf9bc5c8764";
    template-rust-logos.url = "github:LiGoldragon/rust-logos/96eda934a8f3203295f0a08869199441f109c369";
    equivalent-core-nomos.url = "github:LiGoldragon/core-nomos/e1b2febf9f143ab1c84d042d2e9bdd0685303ddc";
    sema-engine.url = "github:LiGoldragon/sema-engine/fe50a6a1de7f707184d1fc7f641d2be0b51089de";
    sema-translator.url = "github:LiGoldragon/sema-translator/6b5499c0d25c801b56582fdcd8e021c3293a6d4d";
    signal-domain.url = "github:LiGoldragon/signal-domain/f6996f935e4c24e494c244d65a57b46bb1045be7";
    signal-frame.url = "github:LiGoldragon/signal-frame/0786fbe8caf27552afcdd5deb85bc82ec6088337";
    signal-nomos.url = "github:LiGoldragon/signal-nomos/44188eb83dea5f0f50d3e4702d19634fc4e7f485";
    signal-sema-translator.url = "github:LiGoldragon/signal-sema-translator/3a26cb43f8ce7f9fe85da64d19aa55aa662943ce";
    schema-language = {
      url = "github:LiGoldragon/schema-language/9c217610c4b8d3bdaa9f95542e28c04424a593e3";
      flake = false;
    };
    schema-rust.url = "github:LiGoldragon/schema-rust/9e36587c85bd69357e9042729ba2df0052799756";
    signal-spirit = {
      url = "github:LiGoldragon/signal-spirit/1cf7c010029de46369b742687da4fa1ca6def9a9";
      flake = false;
    };
    meta-signal-spirit = {
      url = "github:LiGoldragon/meta-signal-spirit/0a7a2438c8e5d57cb1fd413452d0a7ddad4fb9b3";
      flake = false;
    };
    spirit.url = "github:LiGoldragon/spirit/1049b8a1a9e3c2be7ece3553b89c7e3815939d43";
    rust-logos.url = "github:LiGoldragon/rust-logos/55501fddc2d7e154d71fff1659386cbbba712267";
    stream-nomos-types.url = "github:LiGoldragon/nomos-types/a7b831e0540a8ad263cd07ed44ec4c95c56771fb";
    stream-protos.url = "github:LiGoldragon/protos/95aeb1470c549a404518faf1ab0280a36583a2b3";
    stream-core-ethos.url = "github:LiGoldragon/core-ethos/29237c33798db908bbfe10ef0cffe2c6a28be508";
    stream-core-logos.url = "github:LiGoldragon/core-logos/a960aacff8ed13dc14b0ae0094208189d6609434";
    stream-core-nomos.url = "github:LiGoldragon/core-nomos/6ef64cc38a104836b2b236ba4838ffd8e75dced1";
    stream-rust-logos.url = "github:LiGoldragon/rust-logos/f92a8eccd851ebb1f8140ec42e00b04ba73758d0";
    stream-language-engine-witness.url = "github:LiGoldragon/language-engine-witness/efe8ed3d5ea53f280b93cc1f2f131d92ef781832";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      content-identity,
      capsule-content-identity,
      core-ethos,
      core-logos,
      core-nomos,
      language-engine-witness,
      legacy-protos,
      name-table,
      raw-discovery,
      structural-codec,
      protos,
      nomos-protos,
      nomos-engine,
      sealed-core-nomos,
      template-core-logos,
      template-rust-logos,
      equivalent-core-nomos,
      sema-engine,
      sema-translator,
      signal-domain,
      signal-frame,
      signal-nomos,
      signal-sema-translator,
      schema-language,
      schema-rust,
      signal-spirit,
      meta-signal-spirit,
      spirit,
      rust-logos,
      stream-nomos-types,
      stream-protos,
      stream-core-ethos,
      stream-core-logos,
      stream-core-nomos,
      stream-rust-logos,
      stream-language-engine-witness,
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
          sliceThreeCoherence =
            pkgs.runCommand "protos-engine-slice-three-coherence"
              {
                nativeBuildInputs = scriptInputs;
                validatedPinPolicy = exactPins;
              }
              ''
                test -e "$validatedPinPolicy"
                bash ${./scripts/check-slice-three-coherence} \
                  ${self}/flake.lock ${familySourceMap}
                bash ${./scripts/check-slice-three-coherence} \
                  --self-test ${self}/flake.lock ${familySourceMap}
                touch "$out"
              '';
          sliceOneBehaviorWitness =
            pkgs.runCommand "protos-engine-slice-one-behavior-witness"
              {
                validatedPinPolicy = exactPins;
                validatedDependencyDirection = dependencyDirection;
                validatedSliceOneCoherence = sliceOneCoherence;
                ownerNomosEngine = nomos-engine.checks.${system}.test;
                ownerSchemaRust = schema-rust.checks.${system}.test;
                ownerSemaEngine = sema-engine.checks.${system}.test;
                ownerWitness = language-engine-witness.checks.${system}.test;
                ownerSpiritDomainInventory =
                  language-engine-witness.checks.${system}.spirit-domain-inventory;
              }
              ''
                test -e "$validatedPinPolicy"
                test -e "$validatedDependencyDirection"
                test -e "$validatedSliceOneCoherence"
                test -e "$ownerNomosEngine"
                test -e "$ownerSchemaRust"
                test -e "$ownerSemaEngine"
                test -e "$ownerWitness"
                test -e "$ownerSpiritDomainInventory"
                touch "$out"
              '';
          poTwoFiveCoherence =
            pkgs.runCommand "protos-engine-po-two-five-coherence"
              {
                nativeBuildInputs = scriptInputs;
                validatedPinPolicy = exactPins;
              }
              ''
                test -e "$validatedPinPolicy"
                bash ${./scripts/check-po-two-five-coherence} \
                  ${self}/flake.lock ${familySourceMap}
                bash ${./scripts/check-po-two-five-coherence} \
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
                capsule-content-identity-test =
                  capsule-content-identity.checks.${system}.test;
                name-table-test = name-table.checks.${system}.test;
                raw-discovery-test = raw-discovery.checks.${system}.test;
                structural-codec-test = structural-codec.checks.${system}.test;
                signal-sema-translator-test = signal-sema-translator.checks.${system}.test;
                signal-frame-test = signal-frame.checks.${system}.default;
                signal-nomos-test = signal-nomos.checks.${system}.test;
                sema-engine-test = sema-engine.checks.${system}.test;
                sema-translator-test = sema-translator.checks.${system}.test;
                sema-translator-process = sema-translator.checks.${system}.process;
                schema-rust-test = schema-rust.checks.${system}.test;
                schema-rust-sole-bootstrap-surface =
                  schema-rust.checks.${system}.sole-bootstrap-surface;
                stream-nomos-types-test = stream-nomos-types.checks.${system}.test;
                protos-test = protos.checks.${system}.test;
                protos-package-contents = protos.checks.${system}.package-contents;
                nomos-protos-test = nomos-protos.checks.${system}.test;
                nomos-protos-package-contents =
                  nomos-protos.checks.${system}.package-contents;
                core-ethos-test = core-ethos.checks.${system}.test;
                core-logos-test = core-logos.checks.${system}.test;
                rust-logos-test = rust-logos.checks.${system}.test;
                core-nomos-test = core-nomos.checks.${system}.test;
                sealed-core-nomos-test = sealed-core-nomos.checks.${system}.test;
                template-core-logos-test = template-core-logos.checks.${system}.test;
                template-rust-logos-test = template-rust-logos.checks.${system}.test;
                equivalent-core-nomos-test = equivalent-core-nomos.checks.${system}.test;
                nomos-engine-test = nomos-engine.checks.${system}.test;
                language-engine-witness-test =
                  language-engine-witness.checks.${system}.test;
                slice-three-behavior-witness =
                  pkgs.runCommand "protos-engine-slice-three-behavior-witness"
                    {
                      validatedPinPolicy = exactPins;
                      validatedDependencyDirection = dependencyDirection;
                      validatedSliceThreeCoherence = sliceThreeCoherence;
                      ownerNomosTypes = stream-nomos-types.checks.${system}.test;
                      ownerProtos = stream-protos.checks.${system}.test;
                      ownerEthos = stream-core-ethos.checks.${system}.test;
                      ownerLogos = stream-core-logos.checks.${system}.test;
                      ownerNomos = stream-core-nomos.checks.${system}.test;
                      ownerRustLogos = stream-rust-logos.checks.${system}.test;
                      ownerWitness = stream-language-engine-witness.checks.${system}.test;
                    }
                    ''
                      test -e "$validatedPinPolicy"
                      test -e "$validatedDependencyDirection"
                      test -e "$validatedSliceThreeCoherence"
                      test -e "$ownerNomosTypes"
                      test -e "$ownerProtos"
                      test -e "$ownerEthos"
                      test -e "$ownerLogos"
                      test -e "$ownerNomos"
                      test -e "$ownerRustLogos"
                      test -e "$ownerWitness"
                      touch "$out"
                    '';
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
          slice-three-coherence = sliceThreeCoherence;
          po-two-five-coherence = poTwoFiveCoherence;
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
