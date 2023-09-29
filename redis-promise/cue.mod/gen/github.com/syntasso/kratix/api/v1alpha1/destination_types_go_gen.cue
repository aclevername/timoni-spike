// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/syntasso/kratix/api/v1alpha1

package v1alpha1

import (
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

#StateStoreCoreFields: {
	// Path within the StateStore to write documents. This path should be allocated
	// to Kratix as it will create, update, and delete files within this path.
	// Path structure begins with provided path and ends with namespaced destination name:
	//   <StateStore.Spec.Path>/<Destination.Spec.Path>/<Destination.Metadata.Namespace>/<Destination.Metadata.Name>/
	//+kubebuilder:validation:Optional
	path?: string @go(Path)

	// SecretRef specifies the Secret containing authentication credentials
	secretRef?: null | corev1.#SecretReference @go(SecretRef,*corev1.SecretReference)
}

// DestinationSpec defines the desired state of Destination
#DestinationSpec: {
	#StateStoreCoreFields
	stateStoreRef?: null | #StateStoreReference @go(StateStoreRef,*StateStoreReference)
}

// DestinationStatus defines the observed state of Destination
#DestinationStatus: {
}

// Destination is the Schema for the Destinations API
#Destination: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #DestinationSpec   @go(Spec)
	status?:   #DestinationStatus @go(Status)
}

// DestinationList contains a list of Destination
#DestinationList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#Destination] @go(Items,[]Destination)
}

// StateStoreReference is a reference to a StateStore
#StateStoreReference: {
	// +kubebuilder:validation:Enum=BucketStateStore;GitStateStore
	kind: string @go(Kind)
	name: string @go(Name)
}
