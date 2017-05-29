
# Deployment of Apache Cassandra on Kubernetes

Author: Harry Lee

Adapted from the [Original Kubernetes Project](https://github.com/kubernetes/kubernetes/tree/master/examples/storage/cassandra#seed-provider-source). Please refer to the original documentation for full details on the set up.

## Files

Files in the _files_ directory are replicas from the [original repo](https://github.com/kubernetes/kubernetes/tree/master/examples/storage/cassandra/image/files), except for _cassandra.yaml_. Changes in this file are made to fit _VAT IT_ requirements.

## Example

Example **Kubernetes** configurations can be found in the _example_ directory. The Cassandra cluster is deployed using a _Stateful Set_ for persistence storage. This set up includes two services and a storage class.

## Usage

Use the **Makefile** to build and deploy your cassandra image (see the different options in the _Makefile_).

```bash
// For development image with cqlsh, python installed
make build-dev
```
```bash
// For production image
make build
```
