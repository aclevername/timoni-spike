// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/syntasso/kratix/api/v1alpha1

package v1alpha1

import metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

// BucketStateStoreSpec defines the desired state of BucketStateStore
#BucketStateStoreSpec: {
	bucketName: string @go(BucketName)
	endpoint:   string @go(Endpoint)

	#StateStoreCoreFields

	//+kubebuilder:validation:Optional
	insecure: bool @go(Insecure)
}

// BucketStateStoreStatus defines the observed state of BucketStateStore
#BucketStateStoreStatus: {
}

// BucketStateStore is the Schema for the bucketstatestores API
#BucketStateStore: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta      @go(ObjectMeta)
	spec?:     #BucketStateStoreSpec   @go(Spec)
	status?:   #BucketStateStoreStatus @go(Status)
}

// BucketStateStoreList contains a list of BucketStateStore
#BucketStateStoreList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#BucketStateStore] @go(Items,[]BucketStateStore)
}