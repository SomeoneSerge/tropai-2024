{ python3Packages, mkShell }:

mkShell {
  packages = [
    (python3Packages.python.withPackages (ps: with ps; [
      ipykernel
      notebook
      pyro-ppl
      seaborn
      torch
      torchvision
    ]))
  ];
}
