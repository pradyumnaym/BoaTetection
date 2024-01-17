### Combining datasets.

1. Create a folder `data` in the same folder as the notebooks.
2. Download the [Sibenik dataset](https://mega.nz/file/wAk3zbyK#YBz-njyY5v8QTs93aId5CtXDblPqkUmbO8xCAET_4fw) and unzip its contents into `data`. Rename the root folder of the unzipped file to `SibenikDataset`.
3. Download the MaCVi [Object Detection v2 dataset](https://cloud.cs.uni-tuebingen.de/index.php/s/ZZxX65FGnQ8zjBP) and unzip its contents into a folder named `data`.
4. Download the [Kaggle ship classification dataset](https://www.kaggle.com/datasets/vinayakshanawad/ships-dataset) and unzip its contents into a folder named `data`. Rename the root folder of the unzipped file to `shipdataset`.
5. Download the official DL challenge dataset and extract its contents into a folder named `data/CombinedDatasetsChallenge`.
6. Run all cells of the `make_dataset.ipynb` and `make_sibenik_data.ipynb` notebooks. This should create a new folder `data/CombinedDatasets` with the merged data.
7. Run `bash combine.sh`.

### LangSAM

