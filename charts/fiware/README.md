# <img src="doc/pictures/logos/fiware.png" width=110 /> Helm Charts

[![build status](https://git.rwth-aachen.de/eonerc/public/fiware/charts/badges/master/pipeline.svg)](https://git.rwth-aachen.de/eonerc/public/fiware/charts/commits/master)

This repository contains the Docker-Compose/Kubernetes/Helm Charts for deploying a stack of core [FIWARE](https://www.fiware.org/) components.

## Usage

```
$ helm repo add fein https://packages.fein-aachen.org/helm/charts/
$ helm search repo fein
$ helm install fiware-orion fein/fiware-orion
```

## Helm Charts

This repo currently contains three charts:

- `fiware` The main chart for deploying all components
- `fiware-orion` The [FIWARE Orion Context Broker](https://fiware-orion.readthedocs.io/en/master/)

### Under development

- `fiware-iota-json` The [FIWARE JSON IoT Agent](https://fiware-iotagent-json.readthedocs.io/en/latest/)
- `fiware-iota-lightweightm2m` The [FIWARE OMA Lightweight M2M IoT Agent](https://fiware-iotagent-lwm2m.readthedocs.io/en/latest/)
- `fiware-iota-lorawan` The [FIWARE LoraWAN IoT Agent](https://fiware-lorawan.readthedocs.io/en/latest/)
- `fiware-iota-ul` The [FIWARE UltraLight IoT Agent](https://fiware-iotagent-ul.readthedocs.io/en/latest/)
- `fiware-cygnus` The [FIWARE Cygnus GE](https://fiware-cygnus.readthedocs.io/en/latest/)
- `fiware-keyrock` The [FIWARE Identity Manager](https://fiware-idm.readthedocs.io/en/latest/)
- `fiware-quantumleap` The [FIWARE Generic Enabler to support the usage of NGSIv2 data in time-series databases](https://quantumleap.readthedocs.io/en/latest/)
- `fiware-wilma` The [FIWARE Policy Enforcement Point Proxy](https://fiware-pep-proxy.readthedocs.io/en/latest/)
- `fiware-wirecloud` The [FIWARE WireCloud](https://wirecloud.readthedocs.io/en/stable/user_guide/)

Other FIWARE components listed in the [catalogue](https://www.fiware.org/developers/catalogue/) shall be added later

## Copyright

2020, Institute for Automation of Complex Power Systems, EONERC

## License

This project is released under the terms of the [Apache License 2.0](LICENSE).

## Contact

[![EONERC ACS Logo](doc/pictures/eonerc_logo.png)](http://www.acs.eonerc.rwth-aachen.de)

- Steffen Vogel <stvogel@eonerc.rwth-aachen.de>
- Stefan Dähling <sdaehling@eonerc.rwth-aachen.de>

[EON Energy Research Center (EONERC)](http://www.eonerc.rwth-aachen.de)
[RWTH University Aachen, Germany](http://www.rwth-aachen.de)
