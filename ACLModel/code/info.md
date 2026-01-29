**File Organization and Usage Guide: Source Code**

**Executable Files (Scripts)**

- `random_gen.m`: Generates random matrices $H_e^l$ and $H_e$.
- `CreateH.m`: Calculates the Hamiltonian based on the random results and solves for the energy eigenvalues and eigenstates.
- `initial_cond.m`: Generates the five initial states according to the methods described in the report.
- `time-developing.m`: (Optional, required for `plot_1_7.m`) Calculates the time evolution of different energies and entropy.
- `effective_dimension.m`: (Optional, for effective dimension calculation) Calculates the effective dimension.
- `plot_x_y.m`: Code used to generate the figures numbered $x \sim y$ in the original paper.

**How to Run**

1. Execute the subroutines sequentially in the order listed in the "Executable Files" section (from top to bottom).
2. Pay attention to optional scripts; note that some subroutines can be skipped by loading the corresponding data files instead.
3. Finally, use the plotting codes to visualize the results.

**Note:** Due to the Hamiltonian matrix size of $18000 \times 18000$, it is recommended to run this program on a computer with at least **32GB of RAM**.