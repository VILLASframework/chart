# Catalogue

Software project kubernetes files and charts

The [documentation](https://git.rwth-aachen.de/acs/public/catalogue/-/blob/doc/doc/README.md) is in progress.

## Structure

- `charts/` Helm charts
  - `component1/` A directory per component
    - `README.md` A description of this component including a description of all parameters
- `compose/` docker-compose.yml files
  - *(same structure as in `charts/`)*
- `kubernetes/` Raw Kubernetes YAML resource files
  - *(same structure as in `charts/`)*
- `images/` Custom Dockerfiles for projects which do not provide their own (build via CI)
  - `Makefile` to build all images
  - `project1/`
    - `Dockerfile`


## Helm Charts

### Usage

```bash
helm repo add fein https://packages.fein-aachen.org/helm/charts/
helm repo update
helm install -f values.yaml villas fein/villas
```