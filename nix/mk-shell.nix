{ python3Packages, graphviz, mkShell }:

mkShell {
  packages = [
    (python3Packages.python.withPackages (ps: with ps; [
      ipykernel
      notebook
      pyro-ppl
      scipy
      seaborn
      torch
      torchvision
    ]))
    graphviz
  ];
}
