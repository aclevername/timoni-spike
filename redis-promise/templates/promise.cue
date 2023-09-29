package templates

import (
	v1alpha1 "github.com/syntasso/kratix/api/v1alpha1"
)

_platformApi: "platform.kratix.io/v1alpha1"

_gvk: {
	apiVersion: string
	kind:       string
}

#promiseGvk: _gvk & {
	apiVersion: _platformApi
	kind:       "Promise"
}

#pipelineGvk: _gvk & {
	apiVersion: _platformApi
	kind:       "Pipeline"
}

#Promise: v1alpha1.#Promise & {
	_config: #Config
	#promiseGvk
	metadata: {
		name:      _config.metadata.name
		namespace: _config.metadata.namespace
	}
	spec: {
		workflows: resource: configure: [
			{
				#pipelineGvk
				metadata: {
					name:      _config.metadata.name
					namespace: _config.metadata.namespace
				}
				spec: containers: [
					{
						name:  "pipeline-stage-foo"
						image: "foo"
					},
				]
			},
		]
	}
}
