### Combining datasets.

1. Download the [Sibenik dataset](https://mega.nz/file/wAk3zbyK#YBz-njyY5v8QTs93aId5CtXDblPqkUmbO8xCAET_4fw) and unzip its contents into `data`. Rename the root folder of the unzipped file to `SibenikDataset`.
2. Download the MaCVi [Object Detection v2 dataset](https://cloud.cs.uni-tuebingen.de/index.php/s/ZZxX65FGnQ8zjBP) and unzip its contents into a folder named `data`.
3. Download the [Kaggle ship classification dataset](https://www.kaggle.com/datasets/vinayakshanawad/ships-dataset) and unzip its contents into a folder named `data`. Rename the root folder of the unzipped file to `shipdataset`.
4. Download the official DL challenge dataset and extract its contents into a folder named `data/CombinedDatasetsChallenge`.
5. Run all cells of the `make_dataset.ipynb` and `make_sibenik_data.ipynb` notebooks. This should create a new folder `data/CombinedDatasets` with the merged data.
6. Run `cd data && bash combine.sh`.
7. Run `sbatch run_e6.sh` on the TCML cluster.

### LangSAM

