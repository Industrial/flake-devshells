{
  # packages: The packages to add to the devshell.
  packages ? [],
  # buildInputs: The build inputs to add to the devshell.
  buildInputs ? [],
  # inputsFrom: The inputs to add to the devshell.
  inputsFrom ? [],
  # shellHook: The shell hook to add to the devshell.
  shellHook ? "",
}: {
  pkgs,
  self,
  system,
}: {
  default = pkgs.mkShell {
    inherit packages inputsFrom;
    shellHook = shellHook // self.checks.${system}.pre-commit-check.shellHook;
    buildInputs = buildInputs // self.checks.${system}.pre-commit-check.enabledPackages;
  };
}
