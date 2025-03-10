//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSConnectResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSConnectResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSConnectResources

+ (instancetype)sharedInstance {
    static AWSConnectResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSConnectResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-08-08\",\
    \"endpointPrefix\":\"connect\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceAbbreviation\":\"Amazon Connect\",\
    \"serviceFullName\":\"Amazon Connect Service\",\
    \"serviceId\":\"Connect\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"connect\",\
    \"uid\":\"connect-2017-08-08\"\
  },\
  \"operations\":{\
    \"AssociateApprovedOrigin\":{\
      \"name\":\"AssociateApprovedOrigin\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/approved-origin\"\
      },\
      \"input\":{\"shape\":\"AssociateApprovedOriginRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Associates an approved origin to an Amazon Connect instance.</p>\"\
    },\
    \"AssociateBot\":{\
      \"name\":\"AssociateBot\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/bot\"\
      },\
      \"input\":{\"shape\":\"AssociateBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Allows the specified Amazon Connect instance to access the specified Amazon Lex or Amazon Lex V2 bot.</p>\"\
    },\
    \"AssociateDefaultVocabulary\":{\
      \"name\":\"AssociateDefaultVocabulary\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/default-vocabulary/{InstanceId}/{LanguageCode}\"\
      },\
      \"input\":{\"shape\":\"AssociateDefaultVocabularyRequest\"},\
      \"output\":{\"shape\":\"AssociateDefaultVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Associates an existing vocabulary as the default. Contact Lens for Amazon Connect uses the vocabulary in post-call and real-time analysis sessions for the given language.</p>\"\
    },\
    \"AssociateInstanceStorageConfig\":{\
      \"name\":\"AssociateInstanceStorageConfig\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-config\"\
      },\
      \"input\":{\"shape\":\"AssociateInstanceStorageConfigRequest\"},\
      \"output\":{\"shape\":\"AssociateInstanceStorageConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Associates a storage resource type for the first time. You can only associate one type of storage configuration in a single call. This means, for example, that you can't define an instance with multiple S3 buckets for storing chat transcripts.</p> <p>This API does not create a resource that doesn't exist. It only associates it to the instance. Ensure that the resource being specified in the storage configuration, like an S3 bucket, exists when being used for association.</p>\"\
    },\
    \"AssociateLambdaFunction\":{\
      \"name\":\"AssociateLambdaFunction\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/lambda-function\"\
      },\
      \"input\":{\"shape\":\"AssociateLambdaFunctionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Allows the specified Amazon Connect instance to access the specified Lambda function.</p>\"\
    },\
    \"AssociateLexBot\":{\
      \"name\":\"AssociateLexBot\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/lex-bot\"\
      },\
      \"input\":{\"shape\":\"AssociateLexBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Allows the specified Amazon Connect instance to access the specified Amazon Lex bot.</p>\"\
    },\
    \"AssociatePhoneNumberContactFlow\":{\
      \"name\":\"AssociatePhoneNumberContactFlow\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}/contact-flow\"\
      },\
      \"input\":{\"shape\":\"AssociatePhoneNumberContactFlowRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Associates a contact flow with a phone number claimed to your Amazon Connect instance.</p>\"\
    },\
    \"AssociateQueueQuickConnects\":{\
      \"name\":\"AssociateQueueQuickConnects\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/associate-quick-connects\"\
      },\
      \"input\":{\"shape\":\"AssociateQueueQuickConnectsRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Associates a set of quick connects with a queue.</p>\"\
    },\
    \"AssociateRoutingProfileQueues\":{\
      \"name\":\"AssociateRoutingProfileQueues\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/associate-queues\"\
      },\
      \"input\":{\"shape\":\"AssociateRoutingProfileQueuesRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Associates a set of queues with a routing profile.</p>\"\
    },\
    \"AssociateSecurityKey\":{\
      \"name\":\"AssociateSecurityKey\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/security-key\"\
      },\
      \"input\":{\"shape\":\"AssociateSecurityKeyRequest\"},\
      \"output\":{\"shape\":\"AssociateSecurityKeyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Associates a security key to the instance.</p>\"\
    },\
    \"ClaimPhoneNumber\":{\
      \"name\":\"ClaimPhoneNumber\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/phone-number/claim\"\
      },\
      \"input\":{\"shape\":\"ClaimPhoneNumberRequest\"},\
      \"output\":{\"shape\":\"ClaimPhoneNumberResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Claims an available phone number to your Amazon Connect instance.</p>\"\
    },\
    \"CreateAgentStatus\":{\
      \"name\":\"CreateAgentStatus\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/agent-status/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateAgentStatusRequest\"},\
      \"output\":{\"shape\":\"CreateAgentStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Creates an agent status for the specified Amazon Connect instance.</p>\"\
    },\
    \"CreateContactFlow\":{\
      \"name\":\"CreateContactFlow\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact-flows/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateContactFlowRequest\"},\
      \"output\":{\"shape\":\"CreateContactFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidContactFlowException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a contact flow for the specified Amazon Connect instance.</p> <p>You can also create and update contact flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"CreateContactFlowModule\":{\
      \"name\":\"CreateContactFlowModule\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateContactFlowModuleRequest\"},\
      \"output\":{\"shape\":\"CreateContactFlowModuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidContactFlowModuleException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a contact flow module for the specified Amazon Connect instance. </p>\"\
    },\
    \"CreateHoursOfOperation\":{\
      \"name\":\"CreateHoursOfOperation\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/hours-of-operations/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateHoursOfOperationRequest\"},\
      \"output\":{\"shape\":\"CreateHoursOfOperationResponse\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Creates hours of operation. </p>\"\
    },\
    \"CreateInstance\":{\
      \"name\":\"CreateInstance\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance\"\
      },\
      \"input\":{\"shape\":\"CreateInstanceRequest\"},\
      \"output\":{\"shape\":\"CreateInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Initiates an Amazon Connect instance with all the supported channels enabled. It does not attach any storage, such as Amazon Simple Storage Service (Amazon S3) or Amazon Kinesis. It also does not allow for any configurations on features, such as Contact Lens for Amazon Connect. </p> <p>Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days. If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances. You must wait 30 days before you can restart creating and deleting instances in your account.</p>\"\
    },\
    \"CreateIntegrationAssociation\":{\
      \"name\":\"CreateIntegrationAssociation\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations\"\
      },\
      \"input\":{\"shape\":\"CreateIntegrationAssociationRequest\"},\
      \"output\":{\"shape\":\"CreateIntegrationAssociationResponse\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon Web Services resource association with an Amazon Connect instance.</p>\"\
    },\
    \"CreateQueue\":{\
      \"name\":\"CreateQueue\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/queues/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateQueueRequest\"},\
      \"output\":{\"shape\":\"CreateQueueResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Creates a new queue for the specified Amazon Connect instance.</p>\"\
    },\
    \"CreateQuickConnect\":{\
      \"name\":\"CreateQuickConnect\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/quick-connects/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateQuickConnectRequest\"},\
      \"output\":{\"shape\":\"CreateQuickConnectResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a quick connect for the specified Amazon Connect instance.</p>\"\
    },\
    \"CreateRoutingProfile\":{\
      \"name\":\"CreateRoutingProfile\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateRoutingProfileRequest\"},\
      \"output\":{\"shape\":\"CreateRoutingProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a new routing profile.</p>\"\
    },\
    \"CreateSecurityProfile\":{\
      \"name\":\"CreateSecurityProfile\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/security-profiles/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"CreateSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Creates a security profile.</p>\"\
    },\
    \"CreateUseCase\":{\
      \"name\":\"CreateUseCase\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases\"\
      },\
      \"input\":{\"shape\":\"CreateUseCaseRequest\"},\
      \"output\":{\"shape\":\"CreateUseCaseResponse\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a use case for an integration association.</p>\"\
    },\
    \"CreateUser\":{\
      \"name\":\"CreateUser\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/users/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateUserRequest\"},\
      \"output\":{\"shape\":\"CreateUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a user account for the specified Amazon Connect instance.</p> <p>For information about how to create user accounts using the Amazon Connect console, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/user-management.html\\\">Add Users</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"CreateUserHierarchyGroup\":{\
      \"name\":\"CreateUserHierarchyGroup\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/user-hierarchy-groups/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateUserHierarchyGroupRequest\"},\
      \"output\":{\"shape\":\"CreateUserHierarchyGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates a new user hierarchy group.</p>\"\
    },\
    \"CreateVocabulary\":{\
      \"name\":\"CreateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/vocabulary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a custom vocabulary associated with your Amazon Connect instance. You can set a custom vocabulary to be your default vocabulary for a given language. Contact Lens for Amazon Connect uses the default vocabulary in post-call and real-time contact analysis sessions for that language.</p>\"\
    },\
    \"DeleteContactFlow\":{\
      \"name\":\"DeleteContactFlow\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}\"\
      },\
      \"input\":{\"shape\":\"DeleteContactFlowRequest\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a contact flow for the specified Amazon Connect instance.</p>\"\
    },\
    \"DeleteContactFlowModule\":{\
      \"name\":\"DeleteContactFlowModule\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}\"\
      },\
      \"input\":{\"shape\":\"DeleteContactFlowModuleRequest\"},\
      \"output\":{\"shape\":\"DeleteContactFlowModuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified contact flow module.</p>\"\
    },\
    \"DeleteHoursOfOperation\":{\
      \"name\":\"DeleteHoursOfOperation\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/hours-of-operations/{InstanceId}/{HoursOfOperationId}\"\
      },\
      \"input\":{\"shape\":\"DeleteHoursOfOperationRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Deletes an hours of operation.</p>\"\
    },\
    \"DeleteInstance\":{\
      \"name\":\"DeleteInstance\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"DeleteInstanceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Deletes the Amazon Connect instance.</p> <p>Amazon Connect enforces a limit on the total number of instances that you can create or delete in 30 days. If you exceed this limit, you will get an error message indicating there has been an excessive number of attempts at creating or deleting instances. You must wait 30 days before you can restart creating and deleting instances in your account.</p>\"\
    },\
    \"DeleteIntegrationAssociation\":{\
      \"name\":\"DeleteIntegrationAssociation\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}\"\
      },\
      \"input\":{\"shape\":\"DeleteIntegrationAssociationRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes an Amazon Web Services resource association from an Amazon Connect instance. The association must not have any use cases associated with it.</p>\"\
    },\
    \"DeleteQuickConnect\":{\
      \"name\":\"DeleteQuickConnect\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/quick-connects/{InstanceId}/{QuickConnectId}\"\
      },\
      \"input\":{\"shape\":\"DeleteQuickConnectRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes a quick connect.</p>\"\
    },\
    \"DeleteSecurityProfile\":{\
      \"name\":\"DeleteSecurityProfile\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/security-profiles/{InstanceId}/{SecurityProfileId}\"\
      },\
      \"input\":{\"shape\":\"DeleteSecurityProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Deletes a security profile.</p>\"\
    },\
    \"DeleteUseCase\":{\
      \"name\":\"DeleteUseCase\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases/{UseCaseId}\"\
      },\
      \"input\":{\"shape\":\"DeleteUseCaseRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a use case from an integration association.</p>\"\
    },\
    \"DeleteUser\":{\
      \"name\":\"DeleteUser\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}\"\
      },\
      \"input\":{\"shape\":\"DeleteUserRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes a user account from the specified Amazon Connect instance.</p> <p>For information about what happens to a user's data when their account is deleted, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/delete-users.html\\\">Delete Users from Your Amazon Connect Instance</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"DeleteUserHierarchyGroup\":{\
      \"name\":\"DeleteUserHierarchyGroup\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}\"\
      },\
      \"input\":{\"shape\":\"DeleteUserHierarchyGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Deletes an existing user hierarchy group. It must not be associated with any agents or have any active child groups.</p>\"\
    },\
    \"DeleteVocabulary\":{\
      \"name\":\"DeleteVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/vocabulary-remove/{InstanceId}/{VocabularyId}\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyRequest\"},\
      \"output\":{\"shape\":\"DeleteVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ResourceInUseException\"}\
      ],\
      \"documentation\":\"<p>Deletes the vocabulary that has the given identifier.</p>\"\
    },\
    \"DescribeAgentStatus\":{\
      \"name\":\"DescribeAgentStatus\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/agent-status/{InstanceId}/{AgentStatusId}\"\
      },\
      \"input\":{\"shape\":\"DescribeAgentStatusRequest\"},\
      \"output\":{\"shape\":\"DescribeAgentStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes an agent status.</p>\"\
    },\
    \"DescribeContact\":{\
      \"name\":\"DescribeContact\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contacts/{InstanceId}/{ContactId}\"\
      },\
      \"input\":{\"shape\":\"DescribeContactRequest\"},\
      \"output\":{\"shape\":\"DescribeContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes the specified contact. </p> <important> <p>Contact information remains available in Amazon Connect for 24 months, and then it is deleted.</p> </important>\"\
    },\
    \"DescribeContactFlow\":{\
      \"name\":\"DescribeContactFlow\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}\"\
      },\
      \"input\":{\"shape\":\"DescribeContactFlowRequest\"},\
      \"output\":{\"shape\":\"DescribeContactFlowResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ContactFlowNotPublishedException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified contact flow.</p> <p>You can also create and update contact flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"DescribeContactFlowModule\":{\
      \"name\":\"DescribeContactFlowModule\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}\"\
      },\
      \"input\":{\"shape\":\"DescribeContactFlowModuleRequest\"},\
      \"output\":{\"shape\":\"DescribeContactFlowModuleResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified contact flow module.</p>\"\
    },\
    \"DescribeHoursOfOperation\":{\
      \"name\":\"DescribeHoursOfOperation\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/hours-of-operations/{InstanceId}/{HoursOfOperationId}\"\
      },\
      \"input\":{\"shape\":\"DescribeHoursOfOperationRequest\"},\
      \"output\":{\"shape\":\"DescribeHoursOfOperationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes the hours of operation.</p>\"\
    },\
    \"DescribeInstance\":{\
      \"name\":\"DescribeInstance\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceRequest\"},\
      \"output\":{\"shape\":\"DescribeInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns the current state of the specified instance identifier. It tracks the instance while it is being created and returns an error status, if applicable. </p> <p>If an instance is not created successfully, the instance status reason field returns details relevant to the reason. The instance in a failed state is returned only for 24 hours after the CreateInstance API was invoked.</p>\"\
    },\
    \"DescribeInstanceAttribute\":{\
      \"name\":\"DescribeInstanceAttribute\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/attribute/{AttributeType}\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceAttributeRequest\"},\
      \"output\":{\"shape\":\"DescribeInstanceAttributeResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes the specified instance attribute.</p>\"\
    },\
    \"DescribeInstanceStorageConfig\":{\
      \"name\":\"DescribeInstanceStorageConfig\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-config/{AssociationId}\"\
      },\
      \"input\":{\"shape\":\"DescribeInstanceStorageConfigRequest\"},\
      \"output\":{\"shape\":\"DescribeInstanceStorageConfigResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Retrieves the current storage configurations for the specified resource type, association ID, and instance ID.</p>\"\
    },\
    \"DescribePhoneNumber\":{\
      \"name\":\"DescribePhoneNumber\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}\"\
      },\
      \"input\":{\"shape\":\"DescribePhoneNumberRequest\"},\
      \"output\":{\"shape\":\"DescribePhoneNumberResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Gets details and status of a phone number thatâs claimed to your Amazon Connect instance</p>\"\
    },\
    \"DescribeQueue\":{\
      \"name\":\"DescribeQueue\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}\"\
      },\
      \"input\":{\"shape\":\"DescribeQueueRequest\"},\
      \"output\":{\"shape\":\"DescribeQueueResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Describes the specified queue.</p>\"\
    },\
    \"DescribeQuickConnect\":{\
      \"name\":\"DescribeQuickConnect\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/quick-connects/{InstanceId}/{QuickConnectId}\"\
      },\
      \"input\":{\"shape\":\"DescribeQuickConnectRequest\"},\
      \"output\":{\"shape\":\"DescribeQuickConnectResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the quick connect.</p>\"\
    },\
    \"DescribeRoutingProfile\":{\
      \"name\":\"DescribeRoutingProfile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}\"\
      },\
      \"input\":{\"shape\":\"DescribeRoutingProfileRequest\"},\
      \"output\":{\"shape\":\"DescribeRoutingProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified routing profile.</p>\"\
    },\
    \"DescribeSecurityProfile\":{\
      \"name\":\"DescribeSecurityProfile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles/{InstanceId}/{SecurityProfileId}\"\
      },\
      \"input\":{\"shape\":\"DescribeSecurityProfileRequest\"},\
      \"output\":{\"shape\":\"DescribeSecurityProfileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Gets basic information about the security profle.</p>\"\
    },\
    \"DescribeUser\":{\
      \"name\":\"DescribeUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}\"\
      },\
      \"input\":{\"shape\":\"DescribeUserRequest\"},\
      \"output\":{\"shape\":\"DescribeUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified user account. You can find the instance ID in the console (itâs the final part of the ARN). The console does not display the user IDs. Instead, list the users and note the IDs provided in the output.</p>\"\
    },\
    \"DescribeUserHierarchyGroup\":{\
      \"name\":\"DescribeUserHierarchyGroup\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}\"\
      },\
      \"input\":{\"shape\":\"DescribeUserHierarchyGroupRequest\"},\
      \"output\":{\"shape\":\"DescribeUserHierarchyGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified hierarchy group.</p>\"\
    },\
    \"DescribeUserHierarchyStructure\":{\
      \"name\":\"DescribeUserHierarchyStructure\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/user-hierarchy-structure/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"DescribeUserHierarchyStructureRequest\"},\
      \"output\":{\"shape\":\"DescribeUserHierarchyStructureResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Describes the hierarchy structure of the specified Amazon Connect instance.</p>\"\
    },\
    \"DescribeVocabulary\":{\
      \"name\":\"DescribeVocabulary\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/vocabulary/{InstanceId}/{VocabularyId}\"\
      },\
      \"input\":{\"shape\":\"DescribeVocabularyRequest\"},\
      \"output\":{\"shape\":\"DescribeVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Describes the specified vocabulary.</p>\"\
    },\
    \"DisassociateApprovedOrigin\":{\
      \"name\":\"DisassociateApprovedOrigin\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/approved-origin\"\
      },\
      \"input\":{\"shape\":\"DisassociateApprovedOriginRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Revokes access to integrated applications from Amazon Connect.</p>\"\
    },\
    \"DisassociateBot\":{\
      \"name\":\"DisassociateBot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/instance/{InstanceId}/bot\"\
      },\
      \"input\":{\"shape\":\"DisassociateBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Revokes authorization from the specified instance to access the specified Amazon Lex or Amazon Lex V2 bot. </p>\"\
    },\
    \"DisassociateInstanceStorageConfig\":{\
      \"name\":\"DisassociateInstanceStorageConfig\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-config/{AssociationId}\"\
      },\
      \"input\":{\"shape\":\"DisassociateInstanceStorageConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Removes the storage type configurations for the specified resource type and association ID.</p>\"\
    },\
    \"DisassociateLambdaFunction\":{\
      \"name\":\"DisassociateLambdaFunction\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/lambda-function\"\
      },\
      \"input\":{\"shape\":\"DisassociateLambdaFunctionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Remove the Lambda function from the dropdown options available in the relevant contact flow blocks.</p>\"\
    },\
    \"DisassociateLexBot\":{\
      \"name\":\"DisassociateLexBot\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/lex-bot\"\
      },\
      \"input\":{\"shape\":\"DisassociateLexBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Revokes authorization from the specified instance to access the specified Amazon Lex bot.</p>\"\
    },\
    \"DisassociatePhoneNumberContactFlow\":{\
      \"name\":\"DisassociatePhoneNumberContactFlow\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}/contact-flow\"\
      },\
      \"input\":{\"shape\":\"DisassociatePhoneNumberContactFlowRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Removes the contact flow association from a phone number claimed to your Amazon Connect instance, if a contact flow association exists.</p>\"\
    },\
    \"DisassociateQueueQuickConnects\":{\
      \"name\":\"DisassociateQueueQuickConnects\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/disassociate-quick-connects\"\
      },\
      \"input\":{\"shape\":\"DisassociateQueueQuickConnectsRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Disassociates a set of quick connects from a queue.</p>\"\
    },\
    \"DisassociateRoutingProfileQueues\":{\
      \"name\":\"DisassociateRoutingProfileQueues\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/disassociate-queues\"\
      },\
      \"input\":{\"shape\":\"DisassociateRoutingProfileQueuesRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Disassociates a set of queues from a routing profile.</p>\"\
    },\
    \"DisassociateSecurityKey\":{\
      \"name\":\"DisassociateSecurityKey\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/instance/{InstanceId}/security-key/{AssociationId}\"\
      },\
      \"input\":{\"shape\":\"DisassociateSecurityKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Deletes the specified security key.</p>\"\
    },\
    \"GetContactAttributes\":{\
      \"name\":\"GetContactAttributes\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact/attributes/{InstanceId}/{InitialContactId}\"\
      },\
      \"input\":{\"shape\":\"GetContactAttributesRequest\"},\
      \"output\":{\"shape\":\"GetContactAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the contact attributes for the specified contact.</p>\"\
    },\
    \"GetCurrentMetricData\":{\
      \"name\":\"GetCurrentMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/metrics/current/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"GetCurrentMetricDataRequest\"},\
      \"output\":{\"shape\":\"GetCurrentMetricDataResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets the real-time metric data from the specified Amazon Connect instance.</p> <p>For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html\\\">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"GetFederationToken\":{\
      \"name\":\"GetFederationToken\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/user/federate/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"GetFederationTokenRequest\"},\
      \"output\":{\"shape\":\"GetFederationTokenResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"UserNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"DuplicateResourceException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a token for federation.</p> <note> <p>This API doesn't support root users. If you try to invoke GetFederationToken with root credentials, an error message similar to the following one appears: </p> <p> <code>Provided identity: Principal: .... User: .... cannot be used for federation with Amazon Connect</code> </p> </note>\"\
    },\
    \"GetMetricData\":{\
      \"name\":\"GetMetricData\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/metrics/historical/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"GetMetricDataRequest\"},\
      \"output\":{\"shape\":\"GetMetricDataResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Gets historical metric data from the specified Amazon Connect instance.</p> <p>For a description of each historical metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html\\\">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListAgentStatuses\":{\
      \"name\":\"ListAgentStatuses\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/agent-status/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListAgentStatusRequest\"},\
      \"output\":{\"shape\":\"ListAgentStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Lists agent statuses.</p>\"\
    },\
    \"ListApprovedOrigins\":{\
      \"name\":\"ListApprovedOrigins\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/approved-origins\"\
      },\
      \"input\":{\"shape\":\"ListApprovedOriginsRequest\"},\
      \"output\":{\"shape\":\"ListApprovedOriginsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all approved origins associated with the instance.</p>\"\
    },\
    \"ListBots\":{\
      \"name\":\"ListBots\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/bots\"\
      },\
      \"input\":{\"shape\":\"ListBotsRequest\"},\
      \"output\":{\"shape\":\"ListBotsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>For the specified version of Amazon Lex, returns a paginated list of all the Amazon Lex bots currently associated with the instance. </p>\"\
    },\
    \"ListContactFlowModules\":{\
      \"name\":\"ListContactFlowModules\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-flow-modules-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListContactFlowModulesRequest\"},\
      \"output\":{\"shape\":\"ListContactFlowModulesResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the contact flow modules for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListContactFlows\":{\
      \"name\":\"ListContactFlows\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact-flows-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListContactFlowsRequest\"},\
      \"output\":{\"shape\":\"ListContactFlowsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the contact flows for the specified Amazon Connect instance.</p> <p>You can also create and update contact flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html\\\">Amazon Connect Flow language</a>.</p> <p>For more information about contact flows, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-contact-flows.html\\\">Contact Flows</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListContactReferences\":{\
      \"name\":\"ListContactReferences\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/contact/references/{InstanceId}/{ContactId}\"\
      },\
      \"input\":{\"shape\":\"ListContactReferencesRequest\"},\
      \"output\":{\"shape\":\"ListContactReferencesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>For the specified <code>referenceTypes</code>, returns a list of references associated with the contact. </p>\"\
    },\
    \"ListDefaultVocabularies\":{\
      \"name\":\"ListDefaultVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/default-vocabulary-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListDefaultVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListDefaultVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Lists the default vocabularies for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListHoursOfOperations\":{\
      \"name\":\"ListHoursOfOperations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/hours-of-operations-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListHoursOfOperationsRequest\"},\
      \"output\":{\"shape\":\"ListHoursOfOperationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the hours of operation for the specified Amazon Connect instance.</p> <p>For more information about hours of operation, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/set-hours-operation.html\\\">Set the Hours of Operation for a Queue</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListInstanceAttributes\":{\
      \"name\":\"ListInstanceAttributes\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/attributes\"\
      },\
      \"input\":{\"shape\":\"ListInstanceAttributesRequest\"},\
      \"output\":{\"shape\":\"ListInstanceAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all attribute types for the given instance.</p>\"\
    },\
    \"ListInstanceStorageConfigs\":{\
      \"name\":\"ListInstanceStorageConfigs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-configs\"\
      },\
      \"input\":{\"shape\":\"ListInstanceStorageConfigsRequest\"},\
      \"output\":{\"shape\":\"ListInstanceStorageConfigsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of storage configs for the identified instance and resource type.</p>\"\
    },\
    \"ListInstances\":{\
      \"name\":\"ListInstances\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance\"\
      },\
      \"input\":{\"shape\":\"ListInstancesRequest\"},\
      \"output\":{\"shape\":\"ListInstancesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Return a list of instances which are in active state, creation-in-progress state, and failed state. Instances that aren't successfully created (they are in a failed state) are returned only for 24 hours after the CreateInstance API was invoked.</p>\"\
    },\
    \"ListIntegrationAssociations\":{\
      \"name\":\"ListIntegrationAssociations\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations\"\
      },\
      \"input\":{\"shape\":\"ListIntegrationAssociationsRequest\"},\
      \"output\":{\"shape\":\"ListIntegrationAssociationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the Amazon Web Services resource associations for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListLambdaFunctions\":{\
      \"name\":\"ListLambdaFunctions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/lambda-functions\"\
      },\
      \"input\":{\"shape\":\"ListLambdaFunctionsRequest\"},\
      \"output\":{\"shape\":\"ListLambdaFunctionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all Lambda functions that display in the dropdown options in the relevant contact flow blocks.</p>\"\
    },\
    \"ListLexBots\":{\
      \"name\":\"ListLexBots\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/lex-bots\"\
      },\
      \"input\":{\"shape\":\"ListLexBotsRequest\"},\
      \"output\":{\"shape\":\"ListLexBotsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all the Amazon Lex bots currently associated with the instance.</p>\"\
    },\
    \"ListPhoneNumbers\":{\
      \"name\":\"ListPhoneNumbers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/phone-numbers-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListPhoneNumbersRequest\"},\
      \"output\":{\"shape\":\"ListPhoneNumbersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the phone numbers for the specified Amazon Connect instance. </p> <p>For more information about phone numbers, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html\\\">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListPhoneNumbersV2\":{\
      \"name\":\"ListPhoneNumbersV2\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/phone-number/list\"\
      },\
      \"input\":{\"shape\":\"ListPhoneNumbersV2Request\"},\
      \"output\":{\"shape\":\"ListPhoneNumbersV2Response\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Lists phone numbers claimed to your Amazon Connect instance. </p> <p>For more information about phone numbers, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/contact-center-phone-number.html\\\">Set Up Phone Numbers for Your Contact Center</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListPrompts\":{\
      \"name\":\"ListPrompts\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/prompts-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListPromptsRequest\"},\
      \"output\":{\"shape\":\"ListPromptsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the prompts for the specified Amazon Connect instance.</p>\"\
    },\
    \"ListQueueQuickConnects\":{\
      \"name\":\"ListQueueQuickConnects\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/quick-connects\"\
      },\
      \"input\":{\"shape\":\"ListQueueQuickConnectsRequest\"},\
      \"output\":{\"shape\":\"ListQueueQuickConnectsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Lists the quick connects associated with a queue.</p>\"\
    },\
    \"ListQueues\":{\
      \"name\":\"ListQueues\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/queues-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListQueuesRequest\"},\
      \"output\":{\"shape\":\"ListQueuesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the queues for the specified Amazon Connect instance.</p> <p>If you do not specify a <code>QueueTypes</code> parameter, both standard and agent queues are returned. This might cause an unexpected truncation of results if you have more than 1000 agents and you limit the number of results of the API call in code.</p> <p>For more information about queues, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-queues-standard-and-agent.html\\\">Queues: Standard and Agent</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListQuickConnects\":{\
      \"name\":\"ListQuickConnects\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/quick-connects/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListQuickConnectsRequest\"},\
      \"output\":{\"shape\":\"ListQuickConnectsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides information about the quick connects for the specified Amazon Connect instance. </p>\"\
    },\
    \"ListRoutingProfileQueues\":{\
      \"name\":\"ListRoutingProfileQueues\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/queues\"\
      },\
      \"input\":{\"shape\":\"ListRoutingProfileQueuesRequest\"},\
      \"output\":{\"shape\":\"ListRoutingProfileQueuesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Lists the queues associated with a routing profile.</p>\"\
    },\
    \"ListRoutingProfiles\":{\
      \"name\":\"ListRoutingProfiles\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/routing-profiles-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListRoutingProfilesRequest\"},\
      \"output\":{\"shape\":\"ListRoutingProfilesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the routing profiles for the specified Amazon Connect instance.</p> <p>For more information about routing profiles, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing.html\\\">Routing Profiles</a> and <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/routing-profiles.html\\\">Create a Routing Profile</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListSecurityKeys\":{\
      \"name\":\"ListSecurityKeys\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/security-keys\"\
      },\
      \"input\":{\"shape\":\"ListSecurityKeysRequest\"},\
      \"output\":{\"shape\":\"ListSecurityKeysResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Returns a paginated list of all security keys associated with the instance.</p>\"\
    },\
    \"ListSecurityProfilePermissions\":{\
      \"name\":\"ListSecurityProfilePermissions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles-permissions/{InstanceId}/{SecurityProfileId}\"\
      },\
      \"input\":{\"shape\":\"ListSecurityProfilePermissionsRequest\"},\
      \"output\":{\"shape\":\"ListSecurityProfilePermissionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Lists the permissions granted to a security profile.</p>\"\
    },\
    \"ListSecurityProfiles\":{\
      \"name\":\"ListSecurityProfiles\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/security-profiles-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListSecurityProfilesRequest\"},\
      \"output\":{\"shape\":\"ListSecurityProfilesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the security profiles for the specified Amazon Connect instance.</p> <p>For more information about security profiles, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/connect-security-profiles.html\\\">Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags for the specified resource.</p> <p>For sample policies that use tags, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html\\\">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListUseCases\":{\
      \"name\":\"ListUseCases\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/instance/{InstanceId}/integration-associations/{IntegrationAssociationId}/use-cases\"\
      },\
      \"input\":{\"shape\":\"ListUseCasesRequest\"},\
      \"output\":{\"shape\":\"ListUseCasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the use cases for the integration association. </p>\"\
    },\
    \"ListUserHierarchyGroups\":{\
      \"name\":\"ListUserHierarchyGroups\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/user-hierarchy-groups-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListUserHierarchyGroupsRequest\"},\
      \"output\":{\"shape\":\"ListUserHierarchyGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the hierarchy groups for the specified Amazon Connect instance.</p> <p>For more information about agent hierarchies, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/agent-hierarchy.html\\\">Set Up Agent Hierarchies</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ListUsers\":{\
      \"name\":\"ListUsers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/users-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"ListUsersRequest\"},\
      \"output\":{\"shape\":\"ListUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Provides summary information about the users for the specified Amazon Connect instance.</p>\"\
    },\
    \"PutUserStatus\":{\
      \"name\":\"PutUserStatus\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/status\"\
      },\
      \"input\":{\"shape\":\"PutUserStatusRequest\"},\
      \"output\":{\"shape\":\"PutUserStatusResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Changes the current status of a user or agent in Amazon Connect. If the agent is currently handling a contact, this sets the agent's next status.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/metrics-agent-status.html\\\">Agent status</a> and <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/set-next-status.html\\\">Set your next status</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"ReleasePhoneNumber\":{\
      \"name\":\"ReleasePhoneNumber\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}\"\
      },\
      \"input\":{\"shape\":\"ReleasePhoneNumberRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Releases a phone number previously claimed to an Amazon Connect instance.</p>\"\
    },\
    \"ResumeContactRecording\":{\
      \"name\":\"ResumeContactRecording\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/resume-recording\"\
      },\
      \"input\":{\"shape\":\"ResumeContactRecordingRequest\"},\
      \"output\":{\"shape\":\"ResumeContactRecordingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>When a contact is being recorded, and the recording has been suspended using SuspendContactRecording, this API resumes recording the call.</p> <p>Only voice recordings are supported at this time.</p>\"\
    },\
    \"SearchAvailablePhoneNumbers\":{\
      \"name\":\"SearchAvailablePhoneNumbers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/phone-number/search-available\"\
      },\
      \"input\":{\"shape\":\"SearchAvailablePhoneNumbersRequest\"},\
      \"output\":{\"shape\":\"SearchAvailablePhoneNumbersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Searches for available phone numbers that you can claim to your Amazon Connect instance.</p>\"\
    },\
    \"SearchUsers\":{\
      \"name\":\"SearchUsers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/search-users\"\
      },\
      \"input\":{\"shape\":\"SearchUsersRequest\"},\
      \"output\":{\"shape\":\"SearchUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Searches users in an Amazon Connect instance, with optional filtering.</p>\"\
    },\
    \"SearchVocabularies\":{\
      \"name\":\"SearchVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/vocabulary-summary/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"SearchVocabulariesRequest\"},\
      \"output\":{\"shape\":\"SearchVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Searches for vocabularies within a specific Amazon Connect instance using <code>State</code>, <code>NameStartsWith</code>, and <code>LanguageCode</code>.</p>\"\
    },\
    \"StartChatContact\":{\
      \"name\":\"StartChatContact\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact/chat\"\
      },\
      \"input\":{\"shape\":\"StartChatContactRequest\"},\
      \"output\":{\"shape\":\"StartChatContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Initiates a contact flow to start a new chat for the customer. Response of this API provides a token required to obtain credentials from the <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html\\\">CreateParticipantConnection</a> API in the Amazon Connect Participant Service.</p> <p>When a new chat contact is successfully created, clients must subscribe to the participantâs connection for the created chat within 5 minutes. This is achieved by invoking <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html\\\">CreateParticipantConnection</a> with WEBSOCKET and CONNECTION_CREDENTIALS. </p> <p>A 429 error occurs in the following situations:</p> <ul> <li> <p>API rate limit is exceeded. API TPS throttling returns a <code>TooManyRequests</code> exception.</p> </li> <li> <p>The <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html\\\">quota for concurrent active chats</a> is exceeded. Active chat throttling returns a <code>LimitExceededException</code>.</p> </li> </ul> <p>If you use the <code>ChatDurationInMinutes</code> parameter and receive a 400 error, your account may not support the ability to configure custom chat durations. For more information, contact Amazon Web Services Support. </p> <p>For more information about chat, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat.html\\\">Chat</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"StartContactRecording\":{\
      \"name\":\"StartContactRecording\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/start-recording\"\
      },\
      \"input\":{\"shape\":\"StartContactRecordingRequest\"},\
      \"output\":{\"shape\":\"StartContactRecordingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Starts recording the contact: </p> <ul> <li> <p>If the API is called <i>before</i> the agent joins the call, recording starts when the agent joins the call.</p> </li> <li> <p>If the API is called <i>after</i> the agent joins the call, recording starts at the time of the API call.</p> </li> </ul> <p>StartContactRecording is a one-time action. For example, if you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend and resume it, such as when collecting sensitive information (for example, a credit card number), use SuspendContactRecording and ResumeContactRecording.</p> <p>You can use this API to override the recording behavior configured in the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/set-recording-behavior.html\\\">Set recording behavior</a> block.</p> <p>Only voice recordings are supported at this time.</p>\"\
    },\
    \"StartContactStreaming\":{\
      \"name\":\"StartContactStreaming\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/start-streaming\"\
      },\
      \"input\":{\"shape\":\"StartContactStreamingRequest\"},\
      \"output\":{\"shape\":\"StartContactStreamingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p> Initiates real-time message streaming for a new chat contact.</p> <p> For more information about message streaming, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/chat-message-streaming.html\\\">Enable real-time chat message streaming</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"StartOutboundVoiceContact\":{\
      \"name\":\"StartOutboundVoiceContact\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact/outbound-voice\"\
      },\
      \"input\":{\"shape\":\"StartOutboundVoiceContactRequest\"},\
      \"output\":{\"shape\":\"StartOutboundVoiceContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"DestinationNotAllowedException\"},\
        {\"shape\":\"OutboundContactNotPermittedException\"}\
      ],\
      \"documentation\":\"<p>Places an outbound call to a contact, and then initiates the contact flow. It performs the actions in the contact flow that's specified (in <code>ContactFlowId</code>).</p> <p>Agents do not initiate the outbound API, which means that they do not dial the contact. If the contact flow places an outbound call to a contact, and then puts the contact in queue, the call is then routed to the agent, like any other inbound case.</p> <p>There is a 60-second dialing timeout for this operation. If the call is not connected after 60 seconds, it fails.</p> <note> <p>UK numbers with a 447 prefix are not allowed by default. Before you can dial these UK mobile numbers, you must submit a service quota increase request. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html\\\">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p> </note> <note> <p>Campaign calls are not allowed by default. Before you can make a call with <code>TrafficType</code> = <code>CAMPAIGN</code>, you must submit a service quota increase request. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html\\\">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>. </p> </note>\"\
    },\
    \"StartTaskContact\":{\
      \"name\":\"StartTaskContact\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/contact/task\"\
      },\
      \"input\":{\"shape\":\"StartTaskContactRequest\"},\
      \"output\":{\"shape\":\"StartTaskContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Initiates a contact flow to start a new task.</p>\"\
    },\
    \"StopContact\":{\
      \"name\":\"StopContact\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/stop\"\
      },\
      \"input\":{\"shape\":\"StopContactRequest\"},\
      \"output\":{\"shape\":\"StopContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ContactNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Ends the specified contact. This call does not work for the following initiation methods:</p> <ul> <li> <p>DISCONNECT</p> </li> <li> <p>TRANSFER</p> </li> <li> <p>QUEUE_TRANSFER</p> </li> </ul>\"\
    },\
    \"StopContactRecording\":{\
      \"name\":\"StopContactRecording\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/stop-recording\"\
      },\
      \"input\":{\"shape\":\"StopContactRecordingRequest\"},\
      \"output\":{\"shape\":\"StopContactRecordingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Stops recording a call when a contact is being recorded. StopContactRecording is a one-time action. If you use StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to restart it. For scenarios where the recording has started and you want to suspend it for sensitive information (for example, to collect a credit card number), and then restart it, use SuspendContactRecording and ResumeContactRecording.</p> <p>Only voice recordings are supported at this time.</p>\"\
    },\
    \"StopContactStreaming\":{\
      \"name\":\"StopContactStreaming\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/stop-streaming\"\
      },\
      \"input\":{\"shape\":\"StopContactStreamingRequest\"},\
      \"output\":{\"shape\":\"StopContactStreamingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p> Ends message streaming on a specified contact. To restart message streaming on that contact, call the <a href=\\\"https://docs.aws.amazon.com/connect/latest/APIReference/API_StartContactStreaming.html\\\">StartContactStreaming</a> API. </p>\"\
    },\
    \"SuspendContactRecording\":{\
      \"name\":\"SuspendContactRecording\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/suspend-recording\"\
      },\
      \"input\":{\"shape\":\"SuspendContactRecordingRequest\"},\
      \"output\":{\"shape\":\"SuspendContactRecordingResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>When a contact is being recorded, this API suspends recording the call. For example, you might suspend the call recording while collecting sensitive information, such as a credit card number. Then use ResumeContactRecording to restart recording. </p> <p>The period of time that the recording is suspended is filled with silence in the final recording. </p> <p>Only voice recordings are supported at this time.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Adds the specified tags to the specified resource.</p> <p>The supported resource types are users, routing profiles, queues, quick connects, contact flows, agent status, hours of operation, and phone number.</p> <p>For sample policies that use tags, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security_iam_id-based-policy-examples.html\\\">Amazon Connect Identity-Based Policy Examples</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tags/{resourceArn}\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified resource.</p>\"\
    },\
    \"UpdateAgentStatus\":{\
      \"name\":\"UpdateAgentStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/agent-status/{InstanceId}/{AgentStatusId}\"\
      },\
      \"input\":{\"shape\":\"UpdateAgentStatusRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates agent status.</p>\"\
    },\
    \"UpdateContact\":{\
      \"name\":\"UpdateContact\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contacts/{InstanceId}/{ContactId}\"\
      },\
      \"input\":{\"shape\":\"UpdateContactRequest\"},\
      \"output\":{\"shape\":\"UpdateContactResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Adds or updates user-defined contact information associated with the specified contact. At least one field to be updated must be present in the request.</p> <important> <p>You can add or update user-defined contact information for both ongoing and completed contacts.</p> </important>\"\
    },\
    \"UpdateContactAttributes\":{\
      \"name\":\"UpdateContactAttributes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/attributes\"\
      },\
      \"input\":{\"shape\":\"UpdateContactAttributesRequest\"},\
      \"output\":{\"shape\":\"UpdateContactAttributesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates user-defined contact attributes associated with the specified contact.</p> <p>You can create or update user-defined attributes for both ongoing and completed contacts. For example, while the call is active, you can update the customer's name or the reason the customer called. You can add notes about steps that the agent took during the call that display to the next agent that takes the call. You can also update attributes for a contact using data from your CRM application and save the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such as legal review or to identify abusive callers.</p> <p>Contact attributes are available in Amazon Connect for 24 months, and are then deleted. For information about CTR retention and the maximum size of the CTR attributes section, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html#feature-limits\\\">Feature specifications</a> in the <i>Amazon Connect Administrator Guide</i>. </p> <p> <b>Important:</b> You cannot use the operation to update attributes for contacts that occurred prior to the release of the API, which was September 12, 2018. You can update attributes only for contacts that started after the release of the API. If you attempt to update attributes for a contact that occurred prior to the release of the API, a 400 error is returned. This applies also to queued callbacks that were initiated prior to the release of the API but are still active in your instance.</p>\"\
    },\
    \"UpdateContactFlowContent\":{\
      \"name\":\"UpdateContactFlowContent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}/content\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowContentRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidContactFlowException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified contact flow.</p> <p>You can also create and update contact flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"UpdateContactFlowMetadata\":{\
      \"name\":\"UpdateContactFlowMetadata\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}/metadata\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowMetadataRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates metadata about specified contact flow.</p>\"\
    },\
    \"UpdateContactFlowModuleContent\":{\
      \"name\":\"UpdateContactFlowModuleContent\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/content\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowModuleContentRequest\"},\
      \"output\":{\"shape\":\"UpdateContactFlowModuleContentResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidContactFlowModuleException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates specified contact flow module for the specified Amazon Connect instance. </p>\"\
    },\
    \"UpdateContactFlowModuleMetadata\":{\
      \"name\":\"UpdateContactFlowModuleMetadata\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flow-modules/{InstanceId}/{ContactFlowModuleId}/metadata\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowModuleMetadataRequest\"},\
      \"output\":{\"shape\":\"UpdateContactFlowModuleMetadataResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates metadata about specified contact flow module.</p>\"\
    },\
    \"UpdateContactFlowName\":{\
      \"name\":\"UpdateContactFlowName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact-flows/{InstanceId}/{ContactFlowId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateContactFlowNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>The name of the contact flow.</p> <p>You can also create and update contact flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"UpdateContactSchedule\":{\
      \"name\":\"UpdateContactSchedule\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/contact/schedule\"\
      },\
      \"input\":{\"shape\":\"UpdateContactScheduleRequest\"},\
      \"output\":{\"shape\":\"UpdateContactScheduleResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the scheduled time of a task contact that is already scheduled.</p>\"\
    },\
    \"UpdateHoursOfOperation\":{\
      \"name\":\"UpdateHoursOfOperation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/hours-of-operations/{InstanceId}/{HoursOfOperationId}\"\
      },\
      \"input\":{\"shape\":\"UpdateHoursOfOperationRequest\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the hours of operation.</p>\"\
    },\
    \"UpdateInstanceAttribute\":{\
      \"name\":\"UpdateInstanceAttribute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/instance/{InstanceId}/attribute/{AttributeType}\"\
      },\
      \"input\":{\"shape\":\"UpdateInstanceAttributeRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the value for the specified attribute type.</p>\"\
    },\
    \"UpdateInstanceStorageConfig\":{\
      \"name\":\"UpdateInstanceStorageConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/instance/{InstanceId}/storage-config/{AssociationId}\"\
      },\
      \"input\":{\"shape\":\"UpdateInstanceStorageConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates an existing configuration for a resource type. This API is idempotent.</p>\"\
    },\
    \"UpdatePhoneNumber\":{\
      \"name\":\"UpdatePhoneNumber\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/phone-number/{PhoneNumberId}\"\
      },\
      \"input\":{\"shape\":\"UpdatePhoneNumberRequest\"},\
      \"output\":{\"shape\":\"UpdatePhoneNumberResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"IdempotencyException\"},\
        {\"shape\":\"AccessDeniedException\"}\
      ],\
      \"documentation\":\"<p>Updates your claimed phone number from its current Amazon Connect instance to another Amazon Connect instance in the same Region.</p>\"\
    },\
    \"UpdateQueueHoursOfOperation\":{\
      \"name\":\"UpdateQueueHoursOfOperation\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/hours-of-operation\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueHoursOfOperationRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the hours of operation for the specified queue.</p>\"\
    },\
    \"UpdateQueueMaxContacts\":{\
      \"name\":\"UpdateQueueMaxContacts\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/max-contacts\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueMaxContactsRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the maximum number of contacts allowed in a queue before it is considered full.</p>\"\
    },\
    \"UpdateQueueName\":{\
      \"name\":\"UpdateQueueName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the name and description of a queue. At least <code>Name</code> or <code>Description</code> must be provided.</p>\"\
    },\
    \"UpdateQueueOutboundCallerConfig\":{\
      \"name\":\"UpdateQueueOutboundCallerConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/outbound-caller-config\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueOutboundCallerConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the outbound caller ID name, number, and outbound whisper flow for a specified queue.</p>\"\
    },\
    \"UpdateQueueStatus\":{\
      \"name\":\"UpdateQueueStatus\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/queues/{InstanceId}/{QueueId}/status\"\
      },\
      \"input\":{\"shape\":\"UpdateQueueStatusRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates the status of the queue.</p>\"\
    },\
    \"UpdateQuickConnectConfig\":{\
      \"name\":\"UpdateQuickConnectConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/quick-connects/{InstanceId}/{QuickConnectId}/config\"\
      },\
      \"input\":{\"shape\":\"UpdateQuickConnectConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the configuration settings for the specified quick connect.</p>\"\
    },\
    \"UpdateQuickConnectName\":{\
      \"name\":\"UpdateQuickConnectName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/quick-connects/{InstanceId}/{QuickConnectId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateQuickConnectNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the name and description of a quick connect. The request accepts the following data in JSON format. At least <code>Name</code> or <code>Description</code> must be provided.</p>\"\
    },\
    \"UpdateRoutingProfileConcurrency\":{\
      \"name\":\"UpdateRoutingProfileConcurrency\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/concurrency\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileConcurrencyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the channels that agents can handle in the Contact Control Panel (CCP) for a routing profile.</p>\"\
    },\
    \"UpdateRoutingProfileDefaultOutboundQueue\":{\
      \"name\":\"UpdateRoutingProfileDefaultOutboundQueue\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/default-outbound-queue\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileDefaultOutboundQueueRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the default outbound queue of a routing profile.</p>\"\
    },\
    \"UpdateRoutingProfileName\":{\
      \"name\":\"UpdateRoutingProfileName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the name and description of a routing profile. The request accepts the following data in JSON format. At least <code>Name</code> or <code>Description</code> must be provided.</p>\"\
    },\
    \"UpdateRoutingProfileQueues\":{\
      \"name\":\"UpdateRoutingProfileQueues\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routing-profiles/{InstanceId}/{RoutingProfileId}/queues\"\
      },\
      \"input\":{\"shape\":\"UpdateRoutingProfileQueuesRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the properties associated with a set of queues for a routing profile.</p>\"\
    },\
    \"UpdateSecurityProfile\":{\
      \"name\":\"UpdateSecurityProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/security-profiles/{InstanceId}/{SecurityProfileId}\"\
      },\
      \"input\":{\"shape\":\"UpdateSecurityProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>This API is in preview release for Amazon Connect and is subject to change.</p> <p>Updates a security profile.</p>\"\
    },\
    \"UpdateUserHierarchy\":{\
      \"name\":\"UpdateUserHierarchy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/hierarchy\"\
      },\
      \"input\":{\"shape\":\"UpdateUserHierarchyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Assigns the specified hierarchy group to the specified user.</p>\"\
    },\
    \"UpdateUserHierarchyGroupName\":{\
      \"name\":\"UpdateUserHierarchyGroupName\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/user-hierarchy-groups/{InstanceId}/{HierarchyGroupId}/name\"\
      },\
      \"input\":{\"shape\":\"UpdateUserHierarchyGroupNameRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"DuplicateResourceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the name of the user hierarchy group. </p>\"\
    },\
    \"UpdateUserHierarchyStructure\":{\
      \"name\":\"UpdateUserHierarchyStructure\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/user-hierarchy-structure/{InstanceId}\"\
      },\
      \"input\":{\"shape\":\"UpdateUserHierarchyStructureRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the user hierarchy structure: add, remove, and rename user hierarchy levels.</p>\"\
    },\
    \"UpdateUserIdentityInfo\":{\
      \"name\":\"UpdateUserIdentityInfo\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/identity-info\"\
      },\
      \"input\":{\"shape\":\"UpdateUserIdentityInfoRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the identity information for the specified user.</p> <important> <p>We strongly recommend limiting who has the ability to invoke <code>UpdateUserIdentityInfo</code>. Someone with that ability can change the login credentials of other users by changing their email address. This poses a security risk to your organization. They can change the email address of a user to the attacker's email address, and then reset the password through email. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/security-profile-best-practices.html\\\">Best Practices for Security Profiles</a> in the <i>Amazon Connect Administrator Guide</i>.</p> </important>\"\
    },\
    \"UpdateUserPhoneConfig\":{\
      \"name\":\"UpdateUserPhoneConfig\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/phone-config\"\
      },\
      \"input\":{\"shape\":\"UpdateUserPhoneConfigRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Updates the phone configuration settings for the specified user.</p>\"\
    },\
    \"UpdateUserRoutingProfile\":{\
      \"name\":\"UpdateUserRoutingProfile\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/routing-profile\"\
      },\
      \"input\":{\"shape\":\"UpdateUserRoutingProfileRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Assigns the specified routing profile to the specified user.</p>\"\
    },\
    \"UpdateUserSecurityProfiles\":{\
      \"name\":\"UpdateUserSecurityProfiles\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/users/{InstanceId}/{UserId}/security-profiles\"\
      },\
      \"input\":{\"shape\":\"UpdateUserSecurityProfilesRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"InternalServiceException\"}\
      ],\
      \"documentation\":\"<p>Assigns the specified security profiles to the specified user.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"ARN\":{\"type\":\"string\"},\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>You do not have sufficient permissions to perform this action.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"AfterContactWorkTimeLimit\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"AgentFirstName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AgentInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"AgentResourceId\",\
          \"documentation\":\"<p>The identifier of the agent who accepted the contact.</p>\"\
        },\
        \"ConnectedToAgentTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the contact was connected to the agent.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the agent who accepted the contact.</p>\"\
    },\
    \"AgentLastName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AgentResourceId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"AgentStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AgentStatusARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the agent status.</p>\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier of the agent status.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the agent status.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"AgentStatusDescription\",\
          \"documentation\":\"<p>The description of the agent status.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"AgentStatusType\",\
          \"documentation\":\"<p>The type of agent status.</p>\"\
        },\
        \"DisplayOrder\":{\
          \"shape\":\"AgentStatusOrderNumber\",\
          \"documentation\":\"<p>The display order of the agent status.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"AgentStatusState\",\
          \"documentation\":\"<p>The state of the agent status.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about an agent status.</p>\"\
    },\
    \"AgentStatusDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"AgentStatusId\":{\"type\":\"string\"},\
    \"AgentStatusName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1\
    },\
    \"AgentStatusOrderNumber\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"AgentStatusState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"AgentStatusSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier for an agent status.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the agent status.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the agent status.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"AgentStatusType\",\
          \"documentation\":\"<p>The type of the agent status.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary information for an agent status.</p>\"\
    },\
    \"AgentStatusSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AgentStatusSummary\"}\
    },\
    \"AgentStatusType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ROUTABLE\",\
        \"CUSTOM\",\
        \"OFFLINE\"\
      ]\
    },\
    \"AgentStatusTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AgentStatusType\"},\
      \"max\":3\
    },\
    \"AgentUsername\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AliasArn\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AnswerMachineDetectionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EnableAnswerMachineDetection\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>The flag to indicate if answer machine detection analysis needs to be performed for a voice call. If set to <code>true</code>, <code>TrafficType</code> must be set as <code>CAMPAIGN</code>. </p>\"\
        },\
        \"AwaitAnswerMachinePrompt\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Wait for the answering machine prompt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration of the answering machine detection.</p>\"\
    },\
    \"ApproximateTotalCount\":{\"type\":\"long\"},\
    \"AssociateApprovedOriginRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Origin\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Origin\":{\
          \"shape\":\"Origin\",\
          \"documentation\":\"<p>The domain to add to your allow list.</p>\"\
        }\
      }\
    },\
    \"AssociateBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LexBot\":{\"shape\":\"LexBot\"},\
        \"LexV2Bot\":{\
          \"shape\":\"LexV2Bot\",\
          \"documentation\":\"<p>The Amazon Lex V2 bot to associate with the instance.</p>\"\
        }\
      }\
    },\
    \"AssociateDefaultVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"LanguageCode\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary. If this is empty, the default is set to none.</p>\"\
        }\
      }\
    },\
    \"AssociateDefaultVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"AssociateInstanceStorageConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ResourceType\",\
        \"StorageConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\"\
        },\
        \"StorageConfig\":{\
          \"shape\":\"InstanceStorageConfig\",\
          \"documentation\":\"<p>A valid storage type.</p>\"\
        }\
      }\
    },\
    \"AssociateInstanceStorageConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\"\
        }\
      }\
    },\
    \"AssociateLambdaFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"FunctionArn\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the Lambda function being associated. Maximum number of characters allowed is 140.</p>\"\
        }\
      }\
    },\
    \"AssociateLexBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"LexBot\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LexBot\":{\
          \"shape\":\"LexBot\",\
          \"documentation\":\"<p>The Amazon Lex bot to associate with the instance.</p>\"\
        }\
      }\
    },\
    \"AssociatePhoneNumberContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PhoneNumberId\",\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\"\
        }\
      }\
    },\
    \"AssociateQueueQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"QuickConnectIds\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"QuickConnectIds\":{\
          \"shape\":\"QuickConnectsList\",\
          \"documentation\":\"<p>The quick connects to associate with this queue.</p>\"\
        }\
      }\
    },\
    \"AssociateRoutingProfileQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"QueueConfigs\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"QueueConfigs\":{\
          \"shape\":\"RoutingProfileQueueConfigList\",\
          \"documentation\":\"<p>The queues to associate with this routing profile.</p>\"\
        }\
      }\
    },\
    \"AssociateSecurityKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Key\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Key\":{\
          \"shape\":\"PEM\",\
          \"documentation\":\"<p>A valid security key in PEM format.</p>\"\
        }\
      }\
    },\
    \"AssociateSecurityKeyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\"\
        }\
      }\
    },\
    \"AssociationId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"AttachmentReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReferenceKey\",\
          \"documentation\":\"<p>Identifier of the attachment reference.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>Contains the location path of the attachment reference.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ReferenceStatus\",\
          \"documentation\":\"<p>Status of an attachment reference type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the attachment reference if the <code>referenceType</code> is <code>ATTACHMENT</code>. Otherwise, null.</p>\"\
    },\
    \"Attribute\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AttributeType\":{\
          \"shape\":\"InstanceAttributeType\",\
          \"documentation\":\"<p>The type of attribute.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"InstanceAttributeValue\",\
          \"documentation\":\"<p>The value of the attribute.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A toggle for an individual feature at the instance level.</p>\"\
    },\
    \"AttributeName\":{\
      \"type\":\"string\",\
      \"max\":32767,\
      \"min\":1\
    },\
    \"AttributeValue\":{\
      \"type\":\"string\",\
      \"max\":32767,\
      \"min\":0\
    },\
    \"Attributes\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"AttributeName\"},\
      \"value\":{\"shape\":\"AttributeValue\"}\
    },\
    \"AttributesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Attribute\"}\
    },\
    \"AutoAccept\":{\"type\":\"boolean\"},\
    \"AvailableNumberSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about available phone numbers.</p>\"\
    },\
    \"AvailableNumbersList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AvailableNumberSummary\"}\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"BotName\":{\
      \"type\":\"string\",\
      \"max\":50\
    },\
    \"BucketName\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"CampaignId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"Channel\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"VOICE\",\
        \"CHAT\",\
        \"TASK\"\
      ]\
    },\
    \"Channels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Channel\"},\
      \"max\":3\
    },\
    \"ChatContent\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"ChatContentType\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"ChatDurationInMinutes\":{\
      \"type\":\"integer\",\
      \"max\":10080,\
      \"min\":60\
    },\
    \"ChatMessage\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ContentType\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"ContentType\":{\
          \"shape\":\"ChatContentType\",\
          \"documentation\":\"<p>The type of the content. Supported types are <code>text/plain</code>.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ChatContent\",\
          \"documentation\":\"<p>The content of the chat message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A chat message.</p>\"\
    },\
    \"ChatStreamingConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"StreamingEndpointArn\"],\
      \"members\":{\
        \"StreamingEndpointArn\":{\
          \"shape\":\"ChatStreamingEndpointARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the standard Amazon SNS topic. The Amazon Resource Name (ARN) of the streaming endpoint that is used to publish real-time message streaming for chat conversations.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The streaming configuration, such as the Amazon SNS streaming endpoint.</p>\"\
    },\
    \"ChatStreamingEndpointARN\":{\
      \"type\":\"string\",\
      \"max\":350,\
      \"min\":1\
    },\
    \"ClaimPhoneNumberRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetArn\",\
        \"PhoneNumber\"\
      ],\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number you want to claim. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>\"\
        },\
        \"PhoneNumberDescription\":{\
          \"shape\":\"PhoneNumberDescription\",\
          \"documentation\":\"<p>The description of the phone number.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"ClaimPhoneNumberResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\"\
        },\
        \"PhoneNumberArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        }\
      }\
    },\
    \"ClaimedPhoneNumberSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\"\
        },\
        \"PhoneNumberArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"PhoneNumberDescription\":{\
          \"shape\":\"PhoneNumberDescription\",\
          \"documentation\":\"<p>The description of the phone number.</p>\"\
        },\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        },\
        \"PhoneNumberStatus\":{\
          \"shape\":\"PhoneNumberStatus\",\
          \"documentation\":\"<p>The status of the phone number.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a phone number that has been claimed to your Amazon Connect instance.</p>\"\
    },\
    \"ClientToken\":{\
      \"type\":\"string\",\
      \"max\":500\
    },\
    \"CommonNameLength127\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1\
    },\
    \"Comparison\":{\
      \"type\":\"string\",\
      \"enum\":[\"LT\"]\
    },\
    \"Concurrency\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"Contact\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the contact.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier for the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>If this contact is related to other contacts, this is the ID of the initial contact.</p>\"\
        },\
        \"PreviousContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>If this contact is not the first contact, this is the ID of the previous contact.</p>\"\
        },\
        \"InitiationMethod\":{\
          \"shape\":\"ContactInitiationMethod\",\
          \"documentation\":\"<p>Indicates how the contact was initiated.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the contact.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the contact.</p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>How the contact reached your contact center.</p>\"\
        },\
        \"QueueInfo\":{\
          \"shape\":\"QueueInfo\",\
          \"documentation\":\"<p>If this contact was queued, this contains information about the queue. </p>\"\
        },\
        \"AgentInfo\":{\
          \"shape\":\"AgentInfo\",\
          \"documentation\":\"<p>Information about the agent who accepted the contact.</p>\"\
        },\
        \"InitiationTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The date and time this contact was initiated, in UTC time. For <code>INBOUND</code>, this is when the contact arrived. For <code>OUTBOUND</code>, this is when the agent began dialing. For <code>CALLBACK</code>, this is when the callback contact was created. For <code>TRANSFER</code> and <code>QUEUE_TRANSFER</code>, this is when the transfer was initiated. For <code>API</code>, this is when the request arrived.</p>\"\
        },\
        \"DisconnectTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the customer endpoint disconnected from Amazon Connect.</p>\"\
        },\
        \"LastUpdateTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when contact was last updated.</p>\"\
        },\
        \"ScheduledTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp, in Unix epoch time format, at which to start running the inbound flow. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a contact.</p>\"\
    },\
    \"ContactFlow\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the contact flow.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the contact flow.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ContactFlowType\",\
          \"documentation\":\"<p>The type of the contact flow. For descriptions of the available types, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types\\\">Choose a Contact Flow Type</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"ContactFlowState\",\
          \"documentation\":\"<p>The type of contact flow.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowDescription\",\
          \"documentation\":\"<p>The description of the contact flow.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowContent\",\
          \"documentation\":\"<p>The content of the contact flow.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a contact flow.</p>\"\
    },\
    \"ContactFlowContent\":{\"type\":\"string\"},\
    \"ContactFlowDescription\":{\"type\":\"string\"},\
    \"ContactFlowId\":{\
      \"type\":\"string\",\
      \"max\":500\
    },\
    \"ContactFlowModule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN).</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the contact flow module.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowModuleName\",\
          \"documentation\":\"<p>The name of the contact flow module.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowModuleContent\",\
          \"documentation\":\"<p>The content of the contact flow module.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowModuleDescription\",\
          \"documentation\":\"<p>The description of the contact flow module.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"ContactFlowModuleState\",\
          \"documentation\":\"<p>The type of contact flow module.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ContactFlowModuleStatus\",\
          \"documentation\":\"<p>The status of the contact flow module.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a contact flow module.</p>\"\
    },\
    \"ContactFlowModuleContent\":{\
      \"type\":\"string\",\
      \"max\":256000,\
      \"min\":1\
    },\
    \"ContactFlowModuleDescription\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"ContactFlowModuleId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ContactFlowModuleName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"ContactFlowModuleState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"ARCHIVED\"\
      ]\
    },\
    \"ContactFlowModuleStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PUBLISHED\",\
        \"SAVED\"\
      ]\
    },\
    \"ContactFlowModuleSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the contact flow module.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the contact flow module.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowModuleName\",\
          \"documentation\":\"<p>The name of the contact flow module.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"ContactFlowModuleState\",\
          \"documentation\":\"<p>The type of contact flow module.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a contact flow.</p>\"\
    },\
    \"ContactFlowModulesSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactFlowModuleSummary\"}\
    },\
    \"ContactFlowName\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"ContactFlowNotPublishedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The contact flow has not been published.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ContactFlowState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"ARCHIVED\"\
      ]\
    },\
    \"ContactFlowSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the contact flow.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the contact flow.</p>\"\
        },\
        \"ContactFlowType\":{\
          \"shape\":\"ContactFlowType\",\
          \"documentation\":\"<p>The type of contact flow.</p>\"\
        },\
        \"ContactFlowState\":{\
          \"shape\":\"ContactFlowState\",\
          \"documentation\":\"<p>The type of contact flow.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a contact flow.</p> <p>You can also create and update contact flows using the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html\\\">Amazon Connect Flow language</a>.</p>\"\
    },\
    \"ContactFlowSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactFlowSummary\"}\
    },\
    \"ContactFlowType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONTACT_FLOW\",\
        \"CUSTOMER_QUEUE\",\
        \"CUSTOMER_HOLD\",\
        \"CUSTOMER_WHISPER\",\
        \"AGENT_HOLD\",\
        \"AGENT_WHISPER\",\
        \"OUTBOUND_WHISPER\",\
        \"AGENT_TRANSFER\",\
        \"QUEUE_TRANSFER\"\
      ]\
    },\
    \"ContactFlowTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ContactFlowType\"},\
      \"max\":10\
    },\
    \"ContactId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ContactInitiationMethod\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INBOUND\",\
        \"OUTBOUND\",\
        \"TRANSFER\",\
        \"QUEUE_TRANSFER\",\
        \"CALLBACK\",\
        \"API\"\
      ]\
    },\
    \"ContactNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The contact with the specified ID is not active or does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":410},\
      \"exception\":true\
    },\
    \"ContactReferences\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"ReferenceKey\"},\
      \"value\":{\"shape\":\"Reference\"}\
    },\
    \"ControlPlaneTagFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"TagOrConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an <code>OR</code> condition. </p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"TagAndConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an <code>AND</code> condition.</p>\"\
        },\
        \"TagCondition\":{\
          \"shape\":\"TagCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a tag condition. </p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that can be used to specify Tag conditions inside the <code>SearchFilter</code>. This accepts an <code>OR</code> of <code>AND</code> (List of List) input where: </p> <ul> <li> <p>Top level list specifies conditions that need to be applied with <code>OR</code> operator</p> </li> <li> <p>Inner list specifies conditions that need to be applied with <code>AND</code> operator.</p> </li> </ul>\"\
    },\
    \"CreateAgentStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"State\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the status.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"AgentStatusDescription\",\
          \"documentation\":\"<p>The description of the status.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"AgentStatusState\",\
          \"documentation\":\"<p>The state of the status.</p>\"\
        },\
        \"DisplayOrder\":{\
          \"shape\":\"AgentStatusOrderNumber\",\
          \"documentation\":\"<p>The display order of the status.</p>\",\
          \"box\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateAgentStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AgentStatusARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the agent status.</p>\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier of the agent status.</p>\"\
        }\
      }\
    },\
    \"CreateContactFlowModuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowModuleName\",\
          \"documentation\":\"<p>The name of the contact flow module.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowModuleDescription\",\
          \"documentation\":\"<p>The description of the contact flow module. </p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowModuleContent\",\
          \"documentation\":\"<p>The content of the contact flow module.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"CreateContactFlowModuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the contact flow module.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the contact flow module.</p>\"\
        }\
      }\
    },\
    \"CreateContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"Type\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the contact flow.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ContactFlowType\",\
          \"documentation\":\"<p>The type of the contact flow. For descriptions of the available types, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/create-contact-flow.html#contact-flow-types\\\">Choose a Contact Flow Type</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowDescription\",\
          \"documentation\":\"<p>The description of the contact flow. </p>\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowContent\",\
          \"documentation\":\"<p>The content of the contact flow. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        }\
      }\
    },\
    \"CreateContactFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\"\
        },\
        \"ContactFlowArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the contact flow.</p>\"\
        }\
      }\
    },\
    \"CreateHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"TimeZone\",\
        \"Config\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the hours of operation.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"HoursOfOperationDescription\",\
          \"documentation\":\"<p>The description of the hours of operation.</p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"TimeZone\",\
          \"documentation\":\"<p>The time zone of the hours of operation.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HoursOfOperationConfigList\",\
          \"documentation\":\"<p>Configuration information for the hours of operation: day, start time, and end time.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateHoursOfOperationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        },\
        \"HoursOfOperationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the hours of operation.</p>\"\
        }\
      }\
    },\
    \"CreateInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityManagementType\",\
        \"InboundCallsEnabled\",\
        \"OutboundCallsEnabled\"\
      ],\
      \"members\":{\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>The idempotency token.</p>\"\
        },\
        \"IdentityManagementType\":{\
          \"shape\":\"DirectoryType\",\
          \"documentation\":\"<p>The type of identity management for your Amazon Connect users.</p>\"\
        },\
        \"InstanceAlias\":{\
          \"shape\":\"DirectoryAlias\",\
          \"documentation\":\"<p>The name for your instance.</p>\"\
        },\
        \"DirectoryId\":{\
          \"shape\":\"DirectoryId\",\
          \"documentation\":\"<p>The identifier for the directory.</p>\"\
        },\
        \"InboundCallsEnabled\":{\
          \"shape\":\"InboundCallsEnabled\",\
          \"documentation\":\"<p>Your contact center handles incoming contacts.</p>\"\
        },\
        \"OutboundCallsEnabled\":{\
          \"shape\":\"OutboundCallsEnabled\",\
          \"documentation\":\"<p>Your contact center allows outbound calls.</p>\"\
        }\
      }\
    },\
    \"CreateInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier for the instance.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance.</p>\"\
        }\
      }\
    },\
    \"CreateIntegrationAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationType\",\
        \"IntegrationArn\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationType\":{\
          \"shape\":\"IntegrationType\",\
          \"documentation\":\"<p>The type of information to be ingested.</p>\"\
        },\
        \"IntegrationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the integration.</p>\"\
        },\
        \"SourceApplicationUrl\":{\
          \"shape\":\"URI\",\
          \"documentation\":\"<p>The URL for the external application. This field is only required for the EVENT integration type.</p>\"\
        },\
        \"SourceApplicationName\":{\
          \"shape\":\"SourceApplicationName\",\
          \"documentation\":\"<p>The name of the external application. This field is only required for the EVENT integration type.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>The type of the data source. This field is only required for the EVENT integration type.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateIntegrationAssociationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\"\
        },\
        \"IntegrationAssociationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the association.</p>\"\
        }\
      }\
    },\
    \"CreateQueueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QueueDescription\",\
          \"documentation\":\"<p>The description of the queue.</p>\"\
        },\
        \"OutboundCallerConfig\":{\
          \"shape\":\"OutboundCallerConfig\",\
          \"documentation\":\"<p>The outbound caller ID name, number, and outbound whisper flow.</p>\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        },\
        \"MaxContacts\":{\
          \"shape\":\"QueueMaxContacts\",\
          \"documentation\":\"<p>The maximum number of contacts that can be in the queue before it is considered full.</p>\",\
          \"box\":true\
        },\
        \"QuickConnectIds\":{\
          \"shape\":\"QuickConnectsList\",\
          \"documentation\":\"<p>The quick connects available to agents who are working the queue.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateQueueResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QueueArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the queue.</p>\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        }\
      }\
    },\
    \"CreateQuickConnectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"QuickConnectConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"QuickConnectName\",\
          \"documentation\":\"<p>The name of the quick connect.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QuickConnectDescription\",\
          \"documentation\":\"<p>The description of the quick connect.</p>\"\
        },\
        \"QuickConnectConfig\":{\
          \"shape\":\"QuickConnectConfig\",\
          \"documentation\":\"<p>Configuration settings for the quick connect.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateQuickConnectResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnectARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the quick connect. </p>\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect. </p>\"\
        }\
      }\
    },\
    \"CreateRoutingProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Name\",\
        \"Description\",\
        \"DefaultOutboundQueueId\",\
        \"MediaConcurrencies\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Name\":{\
          \"shape\":\"RoutingProfileName\",\
          \"documentation\":\"<p>The name of the routing profile. Must not be more than 127 characters.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"RoutingProfileDescription\",\
          \"documentation\":\"<p>Description of the routing profile. Must not be more than 250 characters.</p>\"\
        },\
        \"DefaultOutboundQueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The default outbound queue for the routing profile.</p>\"\
        },\
        \"QueueConfigs\":{\
          \"shape\":\"RoutingProfileQueueConfigList\",\
          \"documentation\":\"<p>The inbound queues associated with the routing profile. If no queue is added, the agent can make only outbound calls.</p>\"\
        },\
        \"MediaConcurrencies\":{\
          \"shape\":\"MediaConcurrencies\",\
          \"documentation\":\"<p>The channels that agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        }\
      }\
    },\
    \"CreateRoutingProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoutingProfileArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the routing profile.</p>\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\"\
        }\
      }\
    },\
    \"CreateSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileName\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"SecurityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>The description of the security profile.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"PermissionsList\",\
          \"documentation\":\"<p>Permissions assigned to the security profile.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\"\
        },\
        \"SecurityProfileArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the security profile.</p>\"\
        }\
      }\
    },\
    \"CreateUseCaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationAssociationId\",\
        \"UseCaseType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IntegrationAssociationId\"\
        },\
        \"UseCaseType\":{\
          \"shape\":\"UseCaseType\",\
          \"documentation\":\"<p>The type of use case to associate to the integration association. Each integration association can have only one of each use case type.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateUseCaseResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UseCaseId\":{\
          \"shape\":\"UseCaseId\",\
          \"documentation\":\"<p>The identifier of the use case.</p>\"\
        },\
        \"UseCaseArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the use case.</p>\"\
        }\
      }\
    },\
    \"CreateUserHierarchyGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HierarchyGroupName\",\
          \"documentation\":\"<p>The name of the user hierarchy group. Must not be more than 100 characters.</p>\"\
        },\
        \"ParentGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier for the parent hierarchy group. The user hierarchy is created at level one if the parent group ID is null.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateUserHierarchyGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\"\
        },\
        \"HierarchyGroupArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hierarchy group. </p>\"\
        }\
      }\
    },\
    \"CreateUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Username\",\
        \"PhoneConfig\",\
        \"SecurityProfileIds\",\
        \"RoutingProfileId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Username\":{\
          \"shape\":\"AgentUsername\",\
          \"documentation\":\"<p>The user name for the account. For instances not using SAML for identity management, the user name can include up to 20 characters. If you are using SAML for identity management, the user name can include up to 64 characters from [a-zA-Z0-9_-.\\\\@]+.</p>\"\
        },\
        \"Password\":{\
          \"shape\":\"Password\",\
          \"documentation\":\"<p>The password for the user account. A password is required if you are using Amazon Connect for identity management. Otherwise, it is an error to include a password.</p>\"\
        },\
        \"IdentityInfo\":{\
          \"shape\":\"UserIdentityInfo\",\
          \"documentation\":\"<p>The information about the identity of the user.</p>\"\
        },\
        \"PhoneConfig\":{\
          \"shape\":\"UserPhoneConfig\",\
          \"documentation\":\"<p>The phone settings for the user.</p>\"\
        },\
        \"DirectoryUserId\":{\
          \"shape\":\"DirectoryUserId\",\
          \"documentation\":\"<p>The identifier of the user account in the directory used for identity management. If Amazon Connect cannot access the directory, you can specify this identifier to authenticate users. If you include the identifier, we assume that Amazon Connect cannot access the directory. Otherwise, the identity information is used to authenticate users from your directory.</p> <p>This parameter is required if you are using an existing directory for identity management in Amazon Connect when Amazon Connect cannot access your directory to authenticate users. If you are using SAML for identity management and include this parameter, an error is returned.</p>\"\
        },\
        \"SecurityProfileIds\":{\
          \"shape\":\"SecurityProfileIds\",\
          \"documentation\":\"<p>The identifier of the security profile for the user.</p>\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile for the user.</p>\"\
        },\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group for the user.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        }\
      }\
    },\
    \"CreateUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\"\
        },\
        \"UserArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user account.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"VocabularyName\",\
        \"LanguageCode\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If a create request is received more than once with same client token, subsequent requests return the previous response without creating a vocabulary again.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name of the custom vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"Content\":{\
          \"shape\":\"VocabularyContent\",\
          \"documentation\":\"<p>The content of the custom vocabulary in plain-text format with a table of values. Each row in the table represents a word or a phrase, described with <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and <code>DisplayAs</code> fields. Separate the fields with TAB characters. The size limit is 50KB. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table\\\">Create a custom vocabulary using a table</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyArn\",\
        \"VocabularyId\",\
        \"State\"\
      ],\
      \"members\":{\
        \"VocabularyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        }\
      }\
    },\
    \"Credentials\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AccessToken\":{\
          \"shape\":\"SecurityToken\",\
          \"documentation\":\"<p>An access token generated for a federated user to access Amazon Connect.</p>\"\
        },\
        \"AccessTokenExpiration\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>A token generated with an expiration time for the session a user is logged in to Amazon Connect.</p>\"\
        },\
        \"RefreshToken\":{\
          \"shape\":\"SecurityToken\",\
          \"documentation\":\"<p>Renews a token generated for a user to access the Amazon Connect instance.</p>\"\
        },\
        \"RefreshTokenExpiration\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>Renews the expiration timer for a generated token.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains credentials to use for federation.</p>\"\
    },\
    \"CurrentMetric\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CurrentMetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"Unit\",\
          \"documentation\":\"<p>The unit for the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a real-time metric. For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html\\\">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"CurrentMetricData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"CurrentMetric\",\
          \"documentation\":\"<p>Information about the metric.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>The value of the metric.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains the data for a real-time metric.</p>\"\
    },\
    \"CurrentMetricDataCollections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CurrentMetricData\"}\
    },\
    \"CurrentMetricName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The current metric names.</p>\",\
      \"enum\":[\
        \"AGENTS_ONLINE\",\
        \"AGENTS_AVAILABLE\",\
        \"AGENTS_ON_CALL\",\
        \"AGENTS_NON_PRODUCTIVE\",\
        \"AGENTS_AFTER_CONTACT_WORK\",\
        \"AGENTS_ERROR\",\
        \"AGENTS_STAFFED\",\
        \"CONTACTS_IN_QUEUE\",\
        \"OLDEST_CONTACT_AGE\",\
        \"CONTACTS_SCHEDULED\",\
        \"AGENTS_ON_CONTACT\",\
        \"SLOTS_ACTIVE\",\
        \"SLOTS_AVAILABLE\"\
      ]\
    },\
    \"CurrentMetricResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimensions for the metrics.</p>\"\
        },\
        \"Collections\":{\
          \"shape\":\"CurrentMetricDataCollections\",\
          \"documentation\":\"<p>The set of metrics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a set of real-time metrics.</p>\"\
    },\
    \"CurrentMetricResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CurrentMetricResult\"}\
    },\
    \"CurrentMetrics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CurrentMetric\"}\
    },\
    \"DefaultVocabulary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"LanguageCode\",\
        \"VocabularyId\",\
        \"VocabularyName\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name of the custom vocabulary.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a default vocabulary.</p>\"\
    },\
    \"DefaultVocabularyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DefaultVocabulary\"}\
    },\
    \"Delay\":{\
      \"type\":\"integer\",\
      \"max\":9999,\
      \"min\":0\
    },\
    \"DeleteContactFlowModuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowModuleId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowModuleId\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the contact flow module.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowModuleId\"\
        }\
      }\
    },\
    \"DeleteContactFlowModuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        }\
      }\
    },\
    \"DeleteHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HoursOfOperationId\"\
        }\
      }\
    },\
    \"DeleteInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DeleteIntegrationAssociationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationAssociationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IntegrationAssociationId\"\
        }\
      }\
    },\
    \"DeleteQuickConnectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QuickConnectId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QuickConnectId\"\
        }\
      }\
    },\
    \"DeleteSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"SecurityProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SecurityProfileId\"\
        }\
      }\
    },\
    \"DeleteUseCaseRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationAssociationId\",\
        \"UseCaseId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IntegrationAssociationId\"\
        },\
        \"UseCaseId\":{\
          \"shape\":\"UseCaseId\",\
          \"documentation\":\"<p>The identifier for the use case.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UseCaseId\"\
        }\
      }\
    },\
    \"DeleteUserHierarchyGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HierarchyGroupId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HierarchyGroupId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DeleteUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"UserId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        }\
      }\
    },\
    \"DeleteVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"VocabularyId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VocabularyId\"\
        }\
      }\
    },\
    \"DeleteVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyArn\",\
        \"VocabularyId\",\
        \"State\"\
      ],\
      \"members\":{\
        \"VocabularyArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        }\
      }\
    },\
    \"DescribeAgentStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AgentStatusId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier for the agent status.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AgentStatusId\"\
        }\
      }\
    },\
    \"DescribeAgentStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AgentStatus\":{\
          \"shape\":\"AgentStatus\",\
          \"documentation\":\"<p>The agent status.</p>\"\
        }\
      }\
    },\
    \"DescribeContactFlowModuleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowModuleId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowModuleId\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the contact flow module.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowModuleId\"\
        }\
      }\
    },\
    \"DescribeContactFlowModuleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlowModule\":{\
          \"shape\":\"ContactFlowModule\",\
          \"documentation\":\"<p>Information about the contact flow module.</p>\"\
        }\
      }\
    },\
    \"DescribeContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        }\
      }\
    },\
    \"DescribeContactFlowResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlow\":{\
          \"shape\":\"ContactFlow\",\
          \"documentation\":\"<p>Information about the contact flow.</p>\"\
        }\
      }\
    },\
    \"DescribeContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactId\"\
        }\
      }\
    },\
    \"DescribeContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Contact\":{\
          \"shape\":\"Contact\",\
          \"documentation\":\"<p>Information about the contact.</p>\"\
        }\
      }\
    },\
    \"DescribeHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HoursOfOperationId\"\
        }\
      }\
    },\
    \"DescribeHoursOfOperationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperation\":{\
          \"shape\":\"HoursOfOperation\",\
          \"documentation\":\"<p>The hours of operation.</p>\"\
        }\
      }\
    },\
    \"DescribeInstanceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AttributeType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AttributeType\":{\
          \"shape\":\"InstanceAttributeType\",\
          \"documentation\":\"<p>The type of attribute.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AttributeType\"\
        }\
      }\
    },\
    \"DescribeInstanceAttributeResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attribute\":{\
          \"shape\":\"Attribute\",\
          \"documentation\":\"<p>The type of attribute.</p>\"\
        }\
      }\
    },\
    \"DescribeInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Instance\":{\
          \"shape\":\"Instance\",\
          \"documentation\":\"<p>The name of the instance.</p>\"\
        }\
      }\
    },\
    \"DescribeInstanceStorageConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AssociationId\",\
        \"ResourceType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        }\
      }\
    },\
    \"DescribeInstanceStorageConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StorageConfig\":{\
          \"shape\":\"InstanceStorageConfig\",\
          \"documentation\":\"<p>A valid storage type.</p>\"\
        }\
      }\
    },\
    \"DescribePhoneNumberRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PhoneNumberId\"],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        }\
      }\
    },\
    \"DescribePhoneNumberResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ClaimedPhoneNumberSummary\":{\
          \"shape\":\"ClaimedPhoneNumberSummary\",\
          \"documentation\":\"<p>Information about a phone number that's been claimed to your Amazon Connect instance.</p>\"\
        }\
      }\
    },\
    \"DescribeQueueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        }\
      }\
    },\
    \"DescribeQueueResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Queue\":{\
          \"shape\":\"Queue\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        }\
      }\
    },\
    \"DescribeQuickConnectRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QuickConnectId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QuickConnectId\"\
        }\
      }\
    },\
    \"DescribeQuickConnectResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnect\":{\
          \"shape\":\"QuickConnect\",\
          \"documentation\":\"<p>Information about the quick connect.</p>\"\
        }\
      }\
    },\
    \"DescribeRoutingProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        }\
      }\
    },\
    \"DescribeRoutingProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoutingProfile\":{\
          \"shape\":\"RoutingProfile\",\
          \"documentation\":\"<p>The routing profile.</p>\"\
        }\
      }\
    },\
    \"DescribeSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SecurityProfileId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeSecurityProfileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityProfile\":{\
          \"shape\":\"SecurityProfile\",\
          \"documentation\":\"<p>The security profile.</p>\"\
        }\
      }\
    },\
    \"DescribeUserHierarchyGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HierarchyGroupId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HierarchyGroupId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeUserHierarchyGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HierarchyGroup\":{\
          \"shape\":\"HierarchyGroup\",\
          \"documentation\":\"<p>Information about the hierarchy group.</p>\"\
        }\
      }\
    },\
    \"DescribeUserHierarchyStructureRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeUserHierarchyStructureResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HierarchyStructure\":{\
          \"shape\":\"HierarchyStructure\",\
          \"documentation\":\"<p>Information about the hierarchy structure.</p>\"\
        }\
      }\
    },\
    \"DescribeUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"DescribeUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"User\":{\
          \"shape\":\"User\",\
          \"documentation\":\"<p>Information about the user account and configuration settings.</p>\"\
        }\
      }\
    },\
    \"DescribeVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"VocabularyId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"VocabularyId\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"VocabularyId\"\
        }\
      }\
    },\
    \"DescribeVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Vocabulary\"],\
      \"members\":{\
        \"Vocabulary\":{\
          \"shape\":\"Vocabulary\",\
          \"documentation\":\"<p>A list of specific words that you want Contact Lens for Amazon Connect to recognize in your audio input. They are generally domain-specific words and phrases, words that Contact Lens is not recognizing, or proper nouns.</p>\"\
        }\
      }\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"DestinationNotAllowedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the outbound calls.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Outbound calls to the destination number are not allowed.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"Dimensions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Queue\":{\
          \"shape\":\"QueueReference\",\
          \"documentation\":\"<p>Information about the queue for which metrics are returned.</p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channel used for grouping and filters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the dimensions for a set of metrics.</p>\"\
    },\
    \"DirectoryAlias\":{\
      \"type\":\"string\",\
      \"max\":62,\
      \"min\":1,\
      \"pattern\":\"^(?!d-)([\\\\da-zA-Z]+)([-]*[\\\\da-zA-Z])*$\",\
      \"sensitive\":true\
    },\
    \"DirectoryId\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"min\":12,\
      \"pattern\":\"^d-[0-9a-f]{10}$\"\
    },\
    \"DirectoryType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SAML\",\
        \"CONNECT_MANAGED\",\
        \"EXISTING_DIRECTORY\"\
      ]\
    },\
    \"DirectoryUserId\":{\"type\":\"string\"},\
    \"DisassociateApprovedOriginRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Origin\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Origin\":{\
          \"shape\":\"Origin\",\
          \"documentation\":\"<p>The domain URL of the integrated application.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"origin\"\
        }\
      }\
    },\
    \"DisassociateBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LexBot\":{\"shape\":\"LexBot\"},\
        \"LexV2Bot\":{\
          \"shape\":\"LexV2Bot\",\
          \"documentation\":\"<p>The Amazon Lex V2 bot to disassociate from the instance.</p>\"\
        }\
      }\
    },\
    \"DisassociateInstanceStorageConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AssociationId\",\
        \"ResourceType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        }\
      }\
    },\
    \"DisassociateLambdaFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"FunctionArn\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance..</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Lambda function being disassociated.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"functionArn\"\
        }\
      }\
    },\
    \"DisassociateLexBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"BotName\",\
        \"LexRegion\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"BotName\":{\
          \"shape\":\"BotName\",\
          \"documentation\":\"<p>The name of the Amazon Lex bot. Maximum character limit of 50.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"botName\"\
        },\
        \"LexRegion\":{\
          \"shape\":\"LexRegion\",\
          \"documentation\":\"<p>The Region in which the Amazon Lex bot has been created.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"lexRegion\"\
        }\
      }\
    },\
    \"DisassociatePhoneNumberContactFlowRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PhoneNumberId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"instanceId\"\
        }\
      }\
    },\
    \"DisassociateQueueQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"QuickConnectIds\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"QuickConnectIds\":{\
          \"shape\":\"QuickConnectsList\",\
          \"documentation\":\"<p>The quick connects to disassociate from the queue.</p>\"\
        }\
      }\
    },\
    \"DisassociateRoutingProfileQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"QueueReferences\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"QueueReferences\":{\
          \"shape\":\"RoutingProfileQueueReferenceList\",\
          \"documentation\":\"<p>The queues to disassociate from this routing profile.</p>\"\
        }\
      }\
    },\
    \"DisassociateSecurityKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AssociationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationId\"\
        }\
      }\
    },\
    \"DisplayName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"DuplicateResourceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>A resource with the specified name already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"Email\":{\"type\":\"string\"},\
    \"EncryptionConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EncryptionType\",\
        \"KeyId\"\
      ],\
      \"members\":{\
        \"EncryptionType\":{\
          \"shape\":\"EncryptionType\",\
          \"documentation\":\"<p>The type of encryption.</p>\"\
        },\
        \"KeyId\":{\
          \"shape\":\"KeyId\",\
          \"documentation\":\"<p>The full ARN of the encryption key. </p> <note> <p>Be sure to provide the full ARN of the encryption key, not just the ID.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>The encryption configuration.</p>\"\
    },\
    \"EncryptionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"KMS\"]\
    },\
    \"Filters\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Queues\":{\
          \"shape\":\"Queues\",\
          \"documentation\":\"<p>The queues to use to filter the metrics. You should specify at least one queue, and can specify up to 100 queues per request. The <code>GetCurrentMetricsData</code> API in particular requires a queue when you include a <code>Filter</code> in your request. </p>\"\
        },\
        \"Channels\":{\
          \"shape\":\"Channels\",\
          \"documentation\":\"<p>The channel to use to filter the metrics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the filter to apply when retrieving metrics.</p>\"\
    },\
    \"FunctionArn\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1\
    },\
    \"FunctionArnsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionArn\"}\
    },\
    \"GetContactAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"InitialContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the initial contact.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InitialContactId\"\
        }\
      }\
    },\
    \"GetContactAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>Information about the attributes.</p>\"\
        }\
      }\
    },\
    \"GetCurrentMetricDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"Filters\",\
        \"CurrentMetrics\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"Filters\":{\
          \"shape\":\"Filters\",\
          \"documentation\":\"<p>The queues, up to 100, or channels, to use to filter the metrics returned. Metric data is retrieved only for the resources associated with the queues or channels included in the filter. You can include both queue IDs and queue ARNs in the same request. VOICE, CHAT, and TASK channels are supported.</p>\"\
        },\
        \"Groupings\":{\
          \"shape\":\"Groupings\",\
          \"documentation\":\"<p>The grouping applied to the metrics returned. For example, when grouped by <code>QUEUE</code>, the metrics returned apply to each queue rather than aggregated for all queues. If you group by <code>CHANNEL</code>, you should include a Channels filter. VOICE, CHAT, and TASK channels are supported.</p> <p>If no <code>Grouping</code> is included in the request, a summary of metrics is returned.</p>\"\
        },\
        \"CurrentMetrics\":{\
          \"shape\":\"CurrentMetrics\",\
          \"documentation\":\"<p>The metrics to retrieve. Specify the name and unit for each metric. The following metrics are available. For a description of all the metrics, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html\\\">Real-time Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <dl> <dt>AGENTS_AFTER_CONTACT_WORK</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#aftercallwork-real-time\\\">ACW</a> </p> </dd> <dt>AGENTS_AVAILABLE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#available-real-time\\\">Available</a> </p> </dd> <dt>AGENTS_ERROR</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#error-real-time\\\">Error</a> </p> </dd> <dt>AGENTS_NON_PRODUCTIVE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#non-productive-time-real-time\\\">NPT (Non-Productive Time)</a> </p> </dd> <dt>AGENTS_ON_CALL</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#on-call-real-time\\\">On contact</a> </p> </dd> <dt>AGENTS_ON_CONTACT</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#on-call-real-time\\\">On contact</a> </p> </dd> <dt>AGENTS_ONLINE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#online-real-time\\\">Online</a> </p> </dd> <dt>AGENTS_STAFFED</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#staffed-real-time\\\">Staffed</a> </p> </dd> <dt>CONTACTS_IN_QUEUE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#in-queue-real-time\\\">In queue</a> </p> </dd> <dt>CONTACTS_SCHEDULED</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#scheduled-real-time\\\">Scheduled</a> </p> </dd> <dt>OLDEST_CONTACT_AGE</dt> <dd> <p>Unit: SECONDS</p> <p>When you use groupings, Unit says SECONDS and the Value is returned in SECONDS. </p> <p>When you do not use groupings, Unit says SECONDS but the Value is returned in MILLISECONDS. For example, if you get a response like this:</p> <p> <code>{ \\\"Metric\\\": { \\\"Name\\\": \\\"OLDEST_CONTACT_AGE\\\", \\\"Unit\\\": \\\"SECONDS\\\" }, \\\"Value\\\": 24113.0 </code>}</p> <p>The actual OLDEST_CONTACT_AGE is 24 seconds.</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#oldest-real-time\\\">Oldest</a> </p> </dd> <dt>SLOTS_ACTIVE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#active-real-time\\\">Active</a> </p> </dd> <dt>SLOTS_AVAILABLE</dt> <dd> <p>Unit: COUNT</p> <p>Name in real-time metrics report: <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/real-time-metrics-definitions.html#availability-real-time\\\">Availability</a> </p> </dd> </dl>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p> <p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"GetCurrentMetricDataResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p> <p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>\"\
        },\
        \"MetricResults\":{\
          \"shape\":\"CurrentMetricResults\",\
          \"documentation\":\"<p>Information about the real-time metrics.</p>\"\
        },\
        \"DataSnapshotTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The time at which the metrics were retrieved and cached for pagination.</p>\"\
        }\
      }\
    },\
    \"GetFederationTokenRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"GetFederationTokenResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Credentials\":{\
          \"shape\":\"Credentials\",\
          \"documentation\":\"<p>The credentials to use for federation.</p>\"\
        }\
      }\
    },\
    \"GetMetricDataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"StartTime\",\
        \"EndTime\",\
        \"Filters\",\
        \"HistoricalMetrics\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"StartTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp, in UNIX Epoch time format, at which to start the reporting interval for the retrieval of historical metrics data. The time must be specified using a multiple of 5 minutes, such as 10:05, 10:10, 10:15.</p> <p>The start time cannot be earlier than 24 hours before the time of the request. Historical metrics are available only for 24 hours.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp, in UNIX Epoch time format, at which to end the reporting interval for the retrieval of historical metrics data. The time must be specified using an interval of 5 minutes, such as 11:00, 11:05, 11:10, and must be later than the start time timestamp.</p> <p>The time range between the start and end time must be less than 24 hours.</p>\"\
        },\
        \"Filters\":{\
          \"shape\":\"Filters\",\
          \"documentation\":\"<p>The queues, up to 100, or channels, to use to filter the metrics returned. Metric data is retrieved only for the resources associated with the queues or channels included in the filter. You can include both queue IDs and queue ARNs in the same request. VOICE, CHAT, and TASK channels are supported.</p> <note> <p>To filter by <code>Queues</code>, enter the queue ID/ARN, not the name of the queue.</p> </note>\"\
        },\
        \"Groupings\":{\
          \"shape\":\"Groupings\",\
          \"documentation\":\"<p>The grouping applied to the metrics returned. For example, when results are grouped by queue, the metrics returned are grouped by queue. The values returned apply to the metrics for each queue rather than aggregated for all queues.</p> <p>If no grouping is specified, a summary of metrics for all queues is returned.</p>\"\
        },\
        \"HistoricalMetrics\":{\
          \"shape\":\"HistoricalMetrics\",\
          \"documentation\":\"<p>The metrics to retrieve. Specify the name, unit, and statistic for each metric. The following historical metrics are available. For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html\\\">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <note> <p>This API does not support a contacts incoming metric (there's no CONTACTS_INCOMING metric missing from the documented list). </p> </note> <dl> <dt>ABANDON_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>AFTER_CONTACT_WORK_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>API_CONTACTS_HANDLED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CALLBACK_CONTACTS_HANDLED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_ABANDONED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_AGENT_HUNG_UP_FIRST</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_CONSULTED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_HANDLED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_HANDLED_INCOMING</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_HANDLED_OUTBOUND</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_HOLD_ABANDONS</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_MISSED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_QUEUED</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_TRANSFERRED_IN</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_TRANSFERRED_IN_FROM_QUEUE</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_TRANSFERRED_OUT</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>CONTACTS_TRANSFERRED_OUT_FROM_QUEUE</dt> <dd> <p>Unit: COUNT</p> <p>Statistic: SUM</p> </dd> <dt>HANDLE_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>HOLD_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>INTERACTION_AND_HOLD_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>INTERACTION_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>OCCUPANCY</dt> <dd> <p>Unit: PERCENT</p> <p>Statistic: AVG</p> </dd> <dt>QUEUE_ANSWER_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: AVG</p> </dd> <dt>QUEUED_TIME</dt> <dd> <p>Unit: SECONDS</p> <p>Statistic: MAX</p> </dd> <dt>SERVICE_LEVEL</dt> <dd> <p>You can include up to 20 SERVICE_LEVEL metrics in a request.</p> <p>Unit: PERCENT</p> <p>Statistic: AVG</p> <p>Threshold: For <code>ThresholdValue</code>, enter any whole number from 1 to 604800 (inclusive), in seconds. For <code>Comparison</code>, you must enter <code>LT</code> (for \\\"Less than\\\"). </p> </dd> </dl>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"GetMetricDataResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p> <p>The token expires after 5 minutes from the time it is created. Subsequent requests that use the token must use the same request parameters as the request that generated the token.</p>\"\
        },\
        \"MetricResults\":{\
          \"shape\":\"HistoricalMetricResults\",\
          \"documentation\":\"<p>Information about the historical metrics.</p> <p>If no grouping is specified, a summary of metric data is returned.</p>\"\
        }\
      }\
    },\
    \"Grouping\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUE\",\
        \"CHANNEL\"\
      ]\
    },\
    \"Groupings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Grouping\"},\
      \"max\":2\
    },\
    \"HierarchyGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hierarchy group.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HierarchyGroupName\",\
          \"documentation\":\"<p>The name of the hierarchy group.</p>\"\
        },\
        \"LevelId\":{\
          \"shape\":\"HierarchyLevelId\",\
          \"documentation\":\"<p>The identifier of the level in the hierarchy group.</p>\"\
        },\
        \"HierarchyPath\":{\
          \"shape\":\"HierarchyPath\",\
          \"documentation\":\"<p>Information about the levels in the hierarchy group.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a hierarchy group.</p>\"\
    },\
    \"HierarchyGroupCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value in the hierarchy group condition.</p>\"\
        },\
        \"HierarchyGroupMatchType\":{\
          \"shape\":\"HierarchyGroupMatchType\",\
          \"documentation\":\"<p>The type of hierarchy group match.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A leaf node condition which can be used to specify a hierarchy group condition.</p>\"\
    },\
    \"HierarchyGroupId\":{\"type\":\"string\"},\
    \"HierarchyGroupMatchType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EXACT\",\
        \"WITH_CHILD_GROUPS\"\
      ]\
    },\
    \"HierarchyGroupName\":{\"type\":\"string\"},\
    \"HierarchyGroupSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hierarchy group.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HierarchyGroupName\",\
          \"documentation\":\"<p>The name of the hierarchy group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a hierarchy group.</p>\"\
    },\
    \"HierarchyGroupSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HierarchyGroupSummary\"}\
    },\
    \"HierarchyLevel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HierarchyLevelId\",\
          \"documentation\":\"<p>The identifier of the hierarchy level.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hierarchy level.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HierarchyLevelName\",\
          \"documentation\":\"<p>The name of the hierarchy level.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a hierarchy level.</p>\"\
    },\
    \"HierarchyLevelId\":{\"type\":\"string\"},\
    \"HierarchyLevelName\":{\"type\":\"string\"},\
    \"HierarchyLevelUpdate\":{\
      \"type\":\"structure\",\
      \"required\":[\"Name\"],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HierarchyLevelName\",\
          \"documentation\":\"<p>The name of the user hierarchy level. Must not be more than 50 characters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the hierarchy level to update.</p>\"\
    },\
    \"HierarchyPath\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LevelOne\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level one.</p>\"\
        },\
        \"LevelTwo\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level two.</p>\"\
        },\
        \"LevelThree\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level three.</p>\"\
        },\
        \"LevelFour\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level four.</p>\"\
        },\
        \"LevelFive\":{\
          \"shape\":\"HierarchyGroupSummary\",\
          \"documentation\":\"<p>Information about level five.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the levels of a hierarchy group.</p>\"\
    },\
    \"HierarchyStructure\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LevelOne\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level one.</p>\"\
        },\
        \"LevelTwo\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level two.</p>\"\
        },\
        \"LevelThree\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level three.</p>\"\
        },\
        \"LevelFour\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level four.</p>\"\
        },\
        \"LevelFive\":{\
          \"shape\":\"HierarchyLevel\",\
          \"documentation\":\"<p>Information about level five.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a hierarchy structure.</p>\"\
    },\
    \"HierarchyStructureUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LevelOne\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level one.</p>\"\
        },\
        \"LevelTwo\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level two.</p>\"\
        },\
        \"LevelThree\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level three.</p>\"\
        },\
        \"LevelFour\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level four.</p>\"\
        },\
        \"LevelFive\":{\
          \"shape\":\"HierarchyLevelUpdate\",\
          \"documentation\":\"<p>The update for level five.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the level hierarchy to update.</p>\"\
    },\
    \"HistoricalMetric\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HistoricalMetricName\",\
          \"documentation\":\"<p>The name of the metric.</p>\"\
        },\
        \"Threshold\":{\
          \"shape\":\"Threshold\",\
          \"documentation\":\"<p>The threshold for the metric, used with service level metrics.</p>\",\
          \"box\":true\
        },\
        \"Statistic\":{\
          \"shape\":\"Statistic\",\
          \"documentation\":\"<p>The statistic for the metric.</p>\"\
        },\
        \"Unit\":{\
          \"shape\":\"Unit\",\
          \"documentation\":\"<p>The unit for the metric.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a historical metric. For a description of each metric, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/historical-metrics-definitions.html\\\">Historical Metrics Definitions</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
    },\
    \"HistoricalMetricData\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Metric\":{\
          \"shape\":\"HistoricalMetric\",\
          \"documentation\":\"<p>Information about the metric.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>The value of the metric.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains the data for a historical metric.</p>\"\
    },\
    \"HistoricalMetricDataCollections\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HistoricalMetricData\"}\
    },\
    \"HistoricalMetricName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The historical metric names.</p>\",\
      \"enum\":[\
        \"CONTACTS_QUEUED\",\
        \"CONTACTS_HANDLED\",\
        \"CONTACTS_ABANDONED\",\
        \"CONTACTS_CONSULTED\",\
        \"CONTACTS_AGENT_HUNG_UP_FIRST\",\
        \"CONTACTS_HANDLED_INCOMING\",\
        \"CONTACTS_HANDLED_OUTBOUND\",\
        \"CONTACTS_HOLD_ABANDONS\",\
        \"CONTACTS_TRANSFERRED_IN\",\
        \"CONTACTS_TRANSFERRED_OUT\",\
        \"CONTACTS_TRANSFERRED_IN_FROM_QUEUE\",\
        \"CONTACTS_TRANSFERRED_OUT_FROM_QUEUE\",\
        \"CONTACTS_MISSED\",\
        \"CALLBACK_CONTACTS_HANDLED\",\
        \"API_CONTACTS_HANDLED\",\
        \"OCCUPANCY\",\
        \"HANDLE_TIME\",\
        \"AFTER_CONTACT_WORK_TIME\",\
        \"QUEUED_TIME\",\
        \"ABANDON_TIME\",\
        \"QUEUE_ANSWER_TIME\",\
        \"HOLD_TIME\",\
        \"INTERACTION_TIME\",\
        \"INTERACTION_AND_HOLD_TIME\",\
        \"SERVICE_LEVEL\"\
      ]\
    },\
    \"HistoricalMetricResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The dimension for the metrics.</p>\"\
        },\
        \"Collections\":{\
          \"shape\":\"HistoricalMetricDataCollections\",\
          \"documentation\":\"<p>The set of metrics.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the historical metrics retrieved.</p>\"\
    },\
    \"HistoricalMetricResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HistoricalMetricResult\"}\
    },\
    \"HistoricalMetrics\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HistoricalMetric\"}\
    },\
    \"Hours\":{\
      \"type\":\"integer\",\
      \"max\":87600,\
      \"min\":0\
    },\
    \"Hours24Format\":{\
      \"type\":\"integer\",\
      \"max\":23,\
      \"min\":0\
    },\
    \"HoursOfOperation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        },\
        \"HoursOfOperationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the hours of operation.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name for the hours of operation.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"HoursOfOperationDescription\",\
          \"documentation\":\"<p>The description for the hours of operation.</p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"TimeZone\",\
          \"documentation\":\"<p>The time zone for the hours of operation.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HoursOfOperationConfigList\",\
          \"documentation\":\"<p>Configuration information for the hours of operation.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about of the hours of operation.</p>\"\
    },\
    \"HoursOfOperationConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Day\",\
        \"StartTime\",\
        \"EndTime\"\
      ],\
      \"members\":{\
        \"Day\":{\
          \"shape\":\"HoursOfOperationDays\",\
          \"documentation\":\"<p>The day that the hours of operation applies to.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"HoursOfOperationTimeSlice\",\
          \"documentation\":\"<p>The start time that your contact center opens.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"HoursOfOperationTimeSlice\",\
          \"documentation\":\"<p>The end time that your contact center closes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the hours of operation.</p>\"\
    },\
    \"HoursOfOperationConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HoursOfOperationConfig\"},\
      \"max\":100,\
      \"min\":0\
    },\
    \"HoursOfOperationDays\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUNDAY\",\
        \"MONDAY\",\
        \"TUESDAY\",\
        \"WEDNESDAY\",\
        \"THURSDAY\",\
        \"FRIDAY\",\
        \"SATURDAY\"\
      ]\
    },\
    \"HoursOfOperationDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"HoursOfOperationId\":{\"type\":\"string\"},\
    \"HoursOfOperationName\":{\"type\":\"string\"},\
    \"HoursOfOperationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier of the hours of operation.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the hours of operation.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"HoursOfOperationName\",\
          \"documentation\":\"<p>The name of the hours of operation.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about hours of operation for a contact center.</p>\"\
    },\
    \"HoursOfOperationSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"HoursOfOperationSummary\"}\
    },\
    \"HoursOfOperationTimeSlice\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Hours\",\
        \"Minutes\"\
      ],\
      \"members\":{\
        \"Hours\":{\
          \"shape\":\"Hours24Format\",\
          \"documentation\":\"<p>The hours.</p>\",\
          \"box\":true\
        },\
        \"Minutes\":{\
          \"shape\":\"MinutesLimit60\",\
          \"documentation\":\"<p>The minutes.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>The start time or end time for an hours of operation.</p>\"\
    },\
    \"IdempotencyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>An entity with the same name already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"InboundCallsEnabled\":{\"type\":\"boolean\"},\
    \"Instance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"IdentityManagementType\":{\
          \"shape\":\"DirectoryType\",\
          \"documentation\":\"<p>The identity management type.</p>\"\
        },\
        \"InstanceAlias\":{\
          \"shape\":\"DirectoryAlias\",\
          \"documentation\":\"<p>The alias of instance.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the instance was created.</p>\"\
        },\
        \"ServiceRole\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The service role of the instance.</p>\"\
        },\
        \"InstanceStatus\":{\
          \"shape\":\"InstanceStatus\",\
          \"documentation\":\"<p>The state of the instance.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"InstanceStatusReason\",\
          \"documentation\":\"<p>Relevant details why the instance was not successfully created. </p>\"\
        },\
        \"InboundCallsEnabled\":{\
          \"shape\":\"InboundCallsEnabled\",\
          \"documentation\":\"<p>Whether inbound calls are enabled.</p>\"\
        },\
        \"OutboundCallsEnabled\":{\
          \"shape\":\"OutboundCallsEnabled\",\
          \"documentation\":\"<p>Whether outbound calls are enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The Amazon Connect instance.</p>\"\
    },\
    \"InstanceAttributeType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INBOUND_CALLS\",\
        \"OUTBOUND_CALLS\",\
        \"CONTACTFLOW_LOGS\",\
        \"CONTACT_LENS\",\
        \"AUTO_RESOLVE_BEST_VOICES\",\
        \"USE_CUSTOM_TTS_VOICES\",\
        \"EARLY_MEDIA\",\
        \"MULTI_PARTY_CONFERENCE\"\
      ]\
    },\
    \"InstanceAttributeValue\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"InstanceId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"InstanceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATION_IN_PROGRESS\",\
        \"ACTIVE\",\
        \"CREATION_FAILED\"\
      ]\
    },\
    \"InstanceStatusReason\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Relevant details why the instance was not successfully created.</p>\"\
    },\
    \"InstanceStorageConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"StorageType\"],\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\"\
        },\
        \"StorageType\":{\
          \"shape\":\"StorageType\",\
          \"documentation\":\"<p>A valid storage type.</p>\"\
        },\
        \"S3Config\":{\
          \"shape\":\"S3Config\",\
          \"documentation\":\"<p>The S3 bucket configuration.</p>\"\
        },\
        \"KinesisVideoStreamConfig\":{\
          \"shape\":\"KinesisVideoStreamConfig\",\
          \"documentation\":\"<p>The configuration of the Kinesis video stream.</p>\"\
        },\
        \"KinesisStreamConfig\":{\
          \"shape\":\"KinesisStreamConfig\",\
          \"documentation\":\"<p>The configuration of the Kinesis data stream.</p>\"\
        },\
        \"KinesisFirehoseConfig\":{\
          \"shape\":\"KinesisFirehoseConfig\",\
          \"documentation\":\"<p>The configuration of the Kinesis Firehose delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The storage configuration for the instance.</p>\"\
    },\
    \"InstanceStorageConfigs\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceStorageConfig\"}\
    },\
    \"InstanceStorageResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CHAT_TRANSCRIPTS\",\
        \"CALL_RECORDINGS\",\
        \"SCHEDULED_REPORTS\",\
        \"MEDIA_STREAMS\",\
        \"CONTACT_TRACE_RECORDS\",\
        \"AGENT_EVENTS\",\
        \"REAL_TIME_CONTACT_ANALYSIS_SEGMENTS\"\
      ]\
    },\
    \"InstanceSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the instance.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the instance.</p>\"\
        },\
        \"IdentityManagementType\":{\
          \"shape\":\"DirectoryType\",\
          \"documentation\":\"<p>The identity management type of the instance.</p>\"\
        },\
        \"InstanceAlias\":{\
          \"shape\":\"DirectoryAlias\",\
          \"documentation\":\"<p>The alias of the instance.</p>\"\
        },\
        \"CreatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>When the instance was created.</p>\"\
        },\
        \"ServiceRole\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The service role of the instance.</p>\"\
        },\
        \"InstanceStatus\":{\
          \"shape\":\"InstanceStatus\",\
          \"documentation\":\"<p>The state of the instance.</p>\"\
        },\
        \"InboundCallsEnabled\":{\
          \"shape\":\"InboundCallsEnabled\",\
          \"documentation\":\"<p>Whether inbound calls are enabled.</p>\"\
        },\
        \"OutboundCallsEnabled\":{\
          \"shape\":\"OutboundCallsEnabled\",\
          \"documentation\":\"<p>Whether outbound calls are enabled.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the instance.</p>\"\
    },\
    \"InstanceSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InstanceSummary\"}\
    },\
    \"IntegrationAssociationId\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1\
    },\
    \"IntegrationAssociationSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the AppIntegration association.</p>\"\
        },\
        \"IntegrationAssociationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the AppIntegration association.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"IntegrationType\":{\
          \"shape\":\"IntegrationType\",\
          \"documentation\":\"<p>The integration type.</p>\"\
        },\
        \"IntegrationArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the AppIntegration.</p>\"\
        },\
        \"SourceApplicationUrl\":{\
          \"shape\":\"URI\",\
          \"documentation\":\"<p>The URL for the external application.</p>\"\
        },\
        \"SourceApplicationName\":{\
          \"shape\":\"SourceApplicationName\",\
          \"documentation\":\"<p>The user-provided, friendly name for the external application.</p>\"\
        },\
        \"SourceType\":{\
          \"shape\":\"SourceType\",\
          \"documentation\":\"<p>The name of the source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about the associated AppIntegrations.</p>\"\
    },\
    \"IntegrationAssociationSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"IntegrationAssociationSummary\"}\
    },\
    \"IntegrationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"EVENT\",\
        \"VOICE_ID\",\
        \"PINPOINT_APP\",\
        \"WISDOM_ASSISTANT\",\
        \"WISDOM_KNOWLEDGE_BASE\"\
      ]\
    },\
    \"InternalServiceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Request processing failed because of an error or failure with the service.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"InvalidContactFlowException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"problems\":{\
          \"shape\":\"Problems\",\
          \"documentation\":\"<p>The problems with the contact flow. Please fix before trying again.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The contact flow is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidContactFlowModuleException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Problems\":{\"shape\":\"Problems\"}\
      },\
      \"documentation\":\"<p>The problems with the module. Please fix before trying again.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the parameters.</p>\"\
        }\
      },\
      \"documentation\":\"<p>One or more of the specified parameters are not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The request is not valid.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"KeyId\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"KinesisFirehoseConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"FirehoseArn\"],\
      \"members\":{\
        \"FirehoseArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the delivery stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of a Kinesis Data Firehose delivery stream.</p>\"\
    },\
    \"KinesisStreamConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"StreamArn\"],\
      \"members\":{\
        \"StreamArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the data stream.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of a Kinesis data stream.</p>\"\
    },\
    \"KinesisVideoStreamConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Prefix\",\
        \"RetentionPeriodHours\",\
        \"EncryptionConfig\"\
      ],\
      \"members\":{\
        \"Prefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The prefix of the video stream.</p>\"\
        },\
        \"RetentionPeriodHours\":{\
          \"shape\":\"Hours\",\
          \"documentation\":\"<p>The number of hours data is retained in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream.</p> <p>The default value is 0, indicating that the stream does not persist data.</p>\"\
        },\
        \"EncryptionConfig\":{\
          \"shape\":\"EncryptionConfig\",\
          \"documentation\":\"<p>The encryption configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of a Kinesis video stream.</p>\"\
    },\
    \"LargeNextToken\":{\
      \"type\":\"string\",\
      \"max\":100000,\
      \"min\":1\
    },\
    \"LexBot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"BotName\",\
          \"documentation\":\"<p>The name of the Amazon Lex bot.</p>\"\
        },\
        \"LexRegion\":{\
          \"shape\":\"LexRegion\",\
          \"documentation\":\"<p>The Region that the Amazon Lex bot was created in.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of an Amazon Lex bot.</p>\"\
    },\
    \"LexBotConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LexBot\":{\"shape\":\"LexBot\"},\
        \"LexV2Bot\":{\
          \"shape\":\"LexV2Bot\",\
          \"documentation\":\"<p>Configuration information of an Amazon Lex V2 bot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of an Amazon Lex or Amazon Lex V2 bot.</p>\"\
    },\
    \"LexBotConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LexBotConfig\"}\
    },\
    \"LexBotsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LexBot\"}\
    },\
    \"LexRegion\":{\
      \"type\":\"string\",\
      \"max\":60\
    },\
    \"LexV2Bot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AliasArn\":{\
          \"shape\":\"AliasArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Lex V2 bot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of an Amazon Lex V2 bot.</p>\"\
    },\
    \"LexVersion\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"V1\",\
        \"V2\"\
      ]\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the limit.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The allowed limit for the resource has been exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"ListAgentStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"AgentStatusTypes\":{\
          \"shape\":\"AgentStatusTypes\",\
          \"documentation\":\"<p>Available agent status types.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"AgentStatusTypes\"\
        }\
      }\
    },\
    \"ListAgentStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"AgentStatusSummaryList\":{\
          \"shape\":\"AgentStatusSummaryList\",\
          \"documentation\":\"<p>A summary of agent statuses.</p>\"\
        }\
      }\
    },\
    \"ListApprovedOriginsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult25\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListApprovedOriginsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Origins\":{\
          \"shape\":\"OriginsList\",\
          \"documentation\":\"<p>The approved origins.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListBotsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"LexVersion\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult25\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"LexVersion\":{\
          \"shape\":\"LexVersion\",\
          \"documentation\":\"<p>The version of Amazon Lex or Amazon Lex V2.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"lexVersion\"\
        }\
      }\
    },\
    \"ListBotsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LexBots\":{\
          \"shape\":\"LexBotConfigList\",\
          \"documentation\":\"<p>The names and Regions of the Amazon Lex or Amazon Lex V2 bots associated with the specified instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListContactFlowModulesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"ContactFlowModuleState\":{\
          \"shape\":\"ContactFlowModuleState\",\
          \"documentation\":\"<p>The state of the contact flow module.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"state\"\
        }\
      }\
    },\
    \"ListContactFlowModulesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlowModulesSummaryList\":{\
          \"shape\":\"ContactFlowModulesSummaryList\",\
          \"documentation\":\"<p>Information about the contact flow module.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListContactFlowsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowTypes\":{\
          \"shape\":\"ContactFlowTypes\",\
          \"documentation\":\"<p>The type of contact flow.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"contactFlowTypes\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListContactFlowsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactFlowSummaryList\":{\
          \"shape\":\"ContactFlowSummaryList\",\
          \"documentation\":\"<p>Information about the contact flows.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListContactReferencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ReferenceTypes\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the initial contact.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactId\"\
        },\
        \"ReferenceTypes\":{\
          \"shape\":\"ReferenceTypes\",\
          \"documentation\":\"<p>The type of reference.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"referenceTypes\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p> <important> <p>This is not expected to be set, because the value returned in the previous response is always null.</p> </important>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        }\
      }\
    },\
    \"ListContactReferencesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ReferenceSummaryList\":{\
          \"shape\":\"ReferenceSummaryList\",\
          \"documentation\":\"<p>Information about the contact flows.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p> <important> <p>This is always returned as null in the response.</p> </important>\"\
        }\
      }\
    },\
    \"ListDefaultVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"VocabularyNextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListDefaultVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DefaultVocabularyList\"],\
      \"members\":{\
        \"DefaultVocabularyList\":{\
          \"shape\":\"DefaultVocabularyList\",\
          \"documentation\":\"<p>A list of default vocabularies.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"VocabularyNextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListHoursOfOperationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListHoursOfOperationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"HoursOfOperationSummaryList\":{\
          \"shape\":\"HoursOfOperationSummaryList\",\
          \"documentation\":\"<p>Information about the hours of operation.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListInstanceAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult7\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListInstanceAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Attributes\":{\
          \"shape\":\"AttributesList\",\
          \"documentation\":\"<p>The attribute types.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListInstanceStorageConfigsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ResourceType\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult10\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListInstanceStorageConfigsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StorageConfigs\":{\
          \"shape\":\"InstanceStorageConfigs\",\
          \"documentation\":\"<p>A valid storage type.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult10\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListInstancesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceSummaryList\":{\
          \"shape\":\"InstanceSummaryList\",\
          \"documentation\":\"<p>Information about the instances.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListIntegrationAssociationsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationType\":{\
          \"shape\":\"IntegrationType\",\
          \"documentation\":\"<p>The integration type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"integrationType\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListIntegrationAssociationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntegrationAssociationSummaryList\":{\
          \"shape\":\"IntegrationAssociationSummaryList\",\
          \"documentation\":\"<p>The associations.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListLambdaFunctionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult25\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListLambdaFunctionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LambdaFunctions\":{\
          \"shape\":\"FunctionArnsList\",\
          \"documentation\":\"<p>The Lambdafunction ARNs associated with the specified instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListLexBotsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult25\",\
          \"documentation\":\"<p>The maximum number of results to return per page. If no value is specified, the default is 10. </p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListLexBotsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LexBots\":{\
          \"shape\":\"LexBotsList\",\
          \"documentation\":\"<p>The names and Regions of the Amazon Lex bots associated with the specified instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListPhoneNumbersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"PhoneNumberTypes\":{\
          \"shape\":\"PhoneNumberTypes\",\
          \"documentation\":\"<p>The type of phone number.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"phoneNumberTypes\"\
        },\
        \"PhoneNumberCountryCodes\":{\
          \"shape\":\"PhoneNumberCountryCodes\",\
          \"documentation\":\"<p>The ISO country code.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"phoneNumberCountryCodes\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListPhoneNumbersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberSummaryList\":{\
          \"shape\":\"PhoneNumberSummaryList\",\
          \"documentation\":\"<p>Information about the phone numbers.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListPhoneNumbersSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\"\
        },\
        \"PhoneNumberArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number. Phone numbers are formatted <code>[+] [country code] [subscriber number including area code]</code>.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about phone numbers that have been claimed to your Amazon Connect instance.</p>\"\
    },\
    \"ListPhoneNumbersSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListPhoneNumbersSummary\"}\
    },\
    \"ListPhoneNumbersV2Request\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to. If <code>TargetArn</code> input is not provided, this API lists numbers claimed to all the Amazon Connect instances belonging to your account.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"LargeNextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"PhoneNumberCountryCodes\":{\
          \"shape\":\"PhoneNumberCountryCodes\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberTypes\":{\
          \"shape\":\"PhoneNumberTypes\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"PhoneNumberPrefix\":{\
          \"shape\":\"PhoneNumberPrefix\",\
          \"documentation\":\"<p>The prefix of the phone number. If provided, it must contain <code>+</code> as part of the country code.</p>\"\
        }\
      }\
    },\
    \"ListPhoneNumbersV2Response\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"LargeNextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ListPhoneNumbersSummaryList\":{\
          \"shape\":\"ListPhoneNumbersSummaryList\",\
          \"documentation\":\"<p>Information about phone numbers that have been claimed to your Amazon Connect instances.</p>\"\
        }\
      }\
    },\
    \"ListPromptsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListPromptsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PromptSummaryList\":{\
          \"shape\":\"PromptSummaryList\",\
          \"documentation\":\"<p>Information about the prompts.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListQueueQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListQueueQuickConnectsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"QuickConnectSummaryList\":{\
          \"shape\":\"QuickConnectSummaryList\",\
          \"documentation\":\"<p>Information about the quick connects.</p>\"\
        }\
      }\
    },\
    \"ListQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueTypes\":{\
          \"shape\":\"QueueTypes\",\
          \"documentation\":\"<p>The type of queue.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"queueTypes\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListQueuesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QueueSummaryList\":{\
          \"shape\":\"QueueSummaryList\",\
          \"documentation\":\"<p>Information about the queues.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListQuickConnectsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        },\
        \"QuickConnectTypes\":{\
          \"shape\":\"QuickConnectTypes\",\
          \"documentation\":\"<p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE).</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"QuickConnectTypes\"\
        }\
      }\
    },\
    \"ListQuickConnectsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnectSummaryList\":{\
          \"shape\":\"QuickConnectSummaryList\",\
          \"documentation\":\"<p>Information about the quick connects.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListRoutingProfileQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListRoutingProfileQueuesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"RoutingProfileQueueConfigSummaryList\":{\
          \"shape\":\"RoutingProfileQueueConfigSummaryList\",\
          \"documentation\":\"<p>Information about the routing profiles.</p>\"\
        }\
      }\
    },\
    \"ListRoutingProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListRoutingProfilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RoutingProfileSummaryList\":{\
          \"shape\":\"RoutingProfileSummaryList\",\
          \"documentation\":\"<p>Information about the routing profiles.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListSecurityKeysRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult2\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListSecurityKeysResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityKeys\":{\
          \"shape\":\"SecurityKeysList\",\
          \"documentation\":\"<p>The security keys.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListSecurityProfilePermissionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SecurityProfileId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListSecurityProfilePermissionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Permissions\":{\
          \"shape\":\"PermissionsList\",\
          \"documentation\":\"<p>The permissions granted to the security profile.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListSecurityProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListSecurityProfilesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SecurityProfileSummaryList\":{\
          \"shape\":\"SecurityProfileSummaryList\",\
          \"documentation\":\"<p>Information about the security profiles.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceArn\"],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Information about the tags.</p>\"\
        }\
      }\
    },\
    \"ListUseCasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"IntegrationAssociationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"IntegrationAssociationId\":{\
          \"shape\":\"IntegrationAssociationId\",\
          \"documentation\":\"<p>The identifier for the integration association.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IntegrationAssociationId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about the use cases for the specified integration association.</p>\"\
    },\
    \"ListUseCasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UseCaseSummaryList\":{\
          \"shape\":\"UseCaseSummaryList\",\
          \"documentation\":\"<p>The use cases.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListUserHierarchyGroupsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListUserHierarchyGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserHierarchyGroupSummaryList\":{\
          \"shape\":\"HierarchyGroupSummaryList\",\
          \"documentation\":\"<p>Information about the hierarchy groups.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListUsersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"nextToken\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult1000\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"maxResults\"\
        }\
      }\
    },\
    \"ListUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UserSummaryList\":{\
          \"shape\":\"UserSummaryList\",\
          \"documentation\":\"<p>Information about the users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"MaxResult10\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":1\
    },\
    \"MaxResult100\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxResult1000\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"MaxResult2\":{\
      \"type\":\"integer\",\
      \"max\":2,\
      \"min\":1\
    },\
    \"MaxResult25\":{\
      \"type\":\"integer\",\
      \"max\":25,\
      \"min\":1\
    },\
    \"MaxResult7\":{\
      \"type\":\"integer\",\
      \"max\":7,\
      \"min\":1\
    },\
    \"MediaConcurrencies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MediaConcurrency\"}\
    },\
    \"MediaConcurrency\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Channel\",\
        \"Concurrency\"\
      ],\
      \"members\":{\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channels that agents can handle in the Contact Control Panel (CCP).</p>\"\
        },\
        \"Concurrency\":{\
          \"shape\":\"Concurrency\",\
          \"documentation\":\"<p>The number of contacts an agent can have on a channel simultaneously.</p> <p>Valid Range for <code>VOICE</code>: Minimum value of 1. Maximum value of 1.</p> <p>Valid Range for <code>CHAT</code>: Minimum value of 1. Maximum value of 10.</p> <p>Valid Range for <code>TASK</code>: Minimum value of 1. Maximum value of 10.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about which channels are supported, and how many contacts an agent can have on a channel simultaneously.</p>\"\
    },\
    \"Message\":{\"type\":\"string\"},\
    \"MinutesLimit60\":{\
      \"type\":\"integer\",\
      \"max\":59,\
      \"min\":0\
    },\
    \"Name\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":0\
    },\
    \"NextToken\":{\"type\":\"string\"},\
    \"NextToken2500\":{\
      \"type\":\"string\",\
      \"max\":2500,\
      \"min\":1\
    },\
    \"Origin\":{\
      \"type\":\"string\",\
      \"max\":267\
    },\
    \"OriginsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Origin\"}\
    },\
    \"OutboundCallerConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OutboundCallerIdName\":{\
          \"shape\":\"OutboundCallerIdName\",\
          \"documentation\":\"<p>The caller ID name.</p>\"\
        },\
        \"OutboundCallerIdNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>The caller ID number.</p>\"\
        },\
        \"OutboundFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The outbound whisper flow to be used during an outbound call.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The outbound caller ID name, number, and outbound whisper flow.</p>\"\
    },\
    \"OutboundCallerIdName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"OutboundCallsEnabled\":{\"type\":\"boolean\"},\
    \"OutboundContactNotPermittedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the contact.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The contact is not permitted.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"PEM\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"ParticipantDetails\":{\
      \"type\":\"structure\",\
      \"required\":[\"DisplayName\"],\
      \"members\":{\
        \"DisplayName\":{\
          \"shape\":\"DisplayName\",\
          \"documentation\":\"<p>Display name of the participant.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The customer's details.</p>\"\
    },\
    \"ParticipantId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"ParticipantToken\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"Password\":{\
      \"type\":\"string\",\
      \"pattern\":\"/^(?=.*[a-z])(?=.*[A-Z])(?=.*\\\\d)[a-zA-Z\\\\d\\\\S]{8,64}$/\"\
    },\
    \"PermissionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfilePermission\"},\
      \"max\":500\
    },\
    \"PhoneNumber\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\\\\\+[1-9]\\\\\\\\d{1,14}$\"\
    },\
    \"PhoneNumberCountryCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AF\",\
        \"AL\",\
        \"DZ\",\
        \"AS\",\
        \"AD\",\
        \"AO\",\
        \"AI\",\
        \"AQ\",\
        \"AG\",\
        \"AR\",\
        \"AM\",\
        \"AW\",\
        \"AU\",\
        \"AT\",\
        \"AZ\",\
        \"BS\",\
        \"BH\",\
        \"BD\",\
        \"BB\",\
        \"BY\",\
        \"BE\",\
        \"BZ\",\
        \"BJ\",\
        \"BM\",\
        \"BT\",\
        \"BO\",\
        \"BA\",\
        \"BW\",\
        \"BR\",\
        \"IO\",\
        \"VG\",\
        \"BN\",\
        \"BG\",\
        \"BF\",\
        \"BI\",\
        \"KH\",\
        \"CM\",\
        \"CA\",\
        \"CV\",\
        \"KY\",\
        \"CF\",\
        \"TD\",\
        \"CL\",\
        \"CN\",\
        \"CX\",\
        \"CC\",\
        \"CO\",\
        \"KM\",\
        \"CK\",\
        \"CR\",\
        \"HR\",\
        \"CU\",\
        \"CW\",\
        \"CY\",\
        \"CZ\",\
        \"CD\",\
        \"DK\",\
        \"DJ\",\
        \"DM\",\
        \"DO\",\
        \"TL\",\
        \"EC\",\
        \"EG\",\
        \"SV\",\
        \"GQ\",\
        \"ER\",\
        \"EE\",\
        \"ET\",\
        \"FK\",\
        \"FO\",\
        \"FJ\",\
        \"FI\",\
        \"FR\",\
        \"PF\",\
        \"GA\",\
        \"GM\",\
        \"GE\",\
        \"DE\",\
        \"GH\",\
        \"GI\",\
        \"GR\",\
        \"GL\",\
        \"GD\",\
        \"GU\",\
        \"GT\",\
        \"GG\",\
        \"GN\",\
        \"GW\",\
        \"GY\",\
        \"HT\",\
        \"HN\",\
        \"HK\",\
        \"HU\",\
        \"IS\",\
        \"IN\",\
        \"ID\",\
        \"IR\",\
        \"IQ\",\
        \"IE\",\
        \"IM\",\
        \"IL\",\
        \"IT\",\
        \"CI\",\
        \"JM\",\
        \"JP\",\
        \"JE\",\
        \"JO\",\
        \"KZ\",\
        \"KE\",\
        \"KI\",\
        \"KW\",\
        \"KG\",\
        \"LA\",\
        \"LV\",\
        \"LB\",\
        \"LS\",\
        \"LR\",\
        \"LY\",\
        \"LI\",\
        \"LT\",\
        \"LU\",\
        \"MO\",\
        \"MK\",\
        \"MG\",\
        \"MW\",\
        \"MY\",\
        \"MV\",\
        \"ML\",\
        \"MT\",\
        \"MH\",\
        \"MR\",\
        \"MU\",\
        \"YT\",\
        \"MX\",\
        \"FM\",\
        \"MD\",\
        \"MC\",\
        \"MN\",\
        \"ME\",\
        \"MS\",\
        \"MA\",\
        \"MZ\",\
        \"MM\",\
        \"NA\",\
        \"NR\",\
        \"NP\",\
        \"NL\",\
        \"AN\",\
        \"NC\",\
        \"NZ\",\
        \"NI\",\
        \"NE\",\
        \"NG\",\
        \"NU\",\
        \"KP\",\
        \"MP\",\
        \"NO\",\
        \"OM\",\
        \"PK\",\
        \"PW\",\
        \"PA\",\
        \"PG\",\
        \"PY\",\
        \"PE\",\
        \"PH\",\
        \"PN\",\
        \"PL\",\
        \"PT\",\
        \"PR\",\
        \"QA\",\
        \"CG\",\
        \"RE\",\
        \"RO\",\
        \"RU\",\
        \"RW\",\
        \"BL\",\
        \"SH\",\
        \"KN\",\
        \"LC\",\
        \"MF\",\
        \"PM\",\
        \"VC\",\
        \"WS\",\
        \"SM\",\
        \"ST\",\
        \"SA\",\
        \"SN\",\
        \"RS\",\
        \"SC\",\
        \"SL\",\
        \"SG\",\
        \"SX\",\
        \"SK\",\
        \"SI\",\
        \"SB\",\
        \"SO\",\
        \"ZA\",\
        \"KR\",\
        \"ES\",\
        \"LK\",\
        \"SD\",\
        \"SR\",\
        \"SJ\",\
        \"SZ\",\
        \"SE\",\
        \"CH\",\
        \"SY\",\
        \"TW\",\
        \"TJ\",\
        \"TZ\",\
        \"TH\",\
        \"TG\",\
        \"TK\",\
        \"TO\",\
        \"TT\",\
        \"TN\",\
        \"TR\",\
        \"TM\",\
        \"TC\",\
        \"TV\",\
        \"VI\",\
        \"UG\",\
        \"UA\",\
        \"AE\",\
        \"GB\",\
        \"US\",\
        \"UY\",\
        \"UZ\",\
        \"VU\",\
        \"VA\",\
        \"VE\",\
        \"VN\",\
        \"WF\",\
        \"EH\",\
        \"YE\",\
        \"ZM\",\
        \"ZW\"\
      ]\
    },\
    \"PhoneNumberCountryCodes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhoneNumberCountryCode\"},\
      \"max\":10\
    },\
    \"PhoneNumberDescription\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":0,\
      \"pattern\":\"^[\\\\W\\\\S_]*\"\
    },\
    \"PhoneNumberId\":{\"type\":\"string\"},\
    \"PhoneNumberPrefix\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\\\\\+?[0-9]{1,11}\"\
    },\
    \"PhoneNumberQuickConnectConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"PhoneNumber\"],\
      \"members\":{\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number in E.164 format.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a phone number for a quick connect.</p>\"\
    },\
    \"PhoneNumberStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"PhoneNumberWorkflowStatus\",\
          \"documentation\":\"<p>The status.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"PhoneNumberWorkflowMessage\",\
          \"documentation\":\"<p>The status message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The status of the phone number.</p>\"\
    },\
    \"PhoneNumberSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>The identifier of the phone number.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        },\
        \"PhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a phone number for a contact center.</p>\"\
    },\
    \"PhoneNumberSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhoneNumberSummary\"}\
    },\
    \"PhoneNumberType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TOLL_FREE\",\
        \"DID\"\
      ]\
    },\
    \"PhoneNumberTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PhoneNumberType\"},\
      \"max\":2\
    },\
    \"PhoneNumberWorkflowMessage\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":0,\
      \"pattern\":\"^[\\\\W\\\\S_]*\"\
    },\
    \"PhoneNumberWorkflowStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CLAIMED\",\
        \"IN_PROGRESS\",\
        \"FAILED\"\
      ]\
    },\
    \"PhoneType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SOFT_PHONE\",\
        \"DESK_PHONE\"\
      ]\
    },\
    \"Prefix\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"Priority\":{\
      \"type\":\"integer\",\
      \"max\":99,\
      \"min\":1\
    },\
    \"ProblemDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\
          \"shape\":\"ProblemMessageString\",\
          \"documentation\":\"<p>The problem detail's message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about a problem detail.</p>\"\
    },\
    \"ProblemMessageString\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Problems\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ProblemDetail\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"PromptId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"PromptName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"PromptSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"PromptId\",\
          \"documentation\":\"<p>The identifier of the prompt.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the prompt.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"PromptName\",\
          \"documentation\":\"<p>The name of the prompt.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the prompt.</p>\"\
    },\
    \"PromptSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PromptSummary\"}\
    },\
    \"PutUserStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"InstanceId\",\
        \"AgentStatusId\"\
      ],\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier of the agent status.</p>\"\
        }\
      }\
    },\
    \"PutUserStatusResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"Queue\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"QueueArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the queue.</p>\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QueueDescription\",\
          \"documentation\":\"<p>The description of the queue.</p>\"\
        },\
        \"OutboundCallerConfig\":{\
          \"shape\":\"OutboundCallerConfig\",\
          \"documentation\":\"<p>The outbound caller ID name, number, and outbound whisper flow.</p>\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        },\
        \"MaxContacts\":{\
          \"shape\":\"QueueMaxContacts\",\
          \"documentation\":\"<p>The maximum number of contacts that can be in the queue before it is considered full.</p>\",\
          \"box\":true\
        },\
        \"Status\":{\
          \"shape\":\"QueueStatus\",\
          \"documentation\":\"<p>The status of the queue.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a queue.</p>\"\
    },\
    \"QueueDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"QueueId\":{\"type\":\"string\"},\
    \"QueueInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier of the agent who accepted the contact.</p>\"\
        },\
        \"EnqueueTimestamp\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>The timestamp when the contact was added to the queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If this contact was queued, this contains information about the queue. </p>\"\
    },\
    \"QueueMaxContacts\":{\
      \"type\":\"integer\",\
      \"min\":0\
    },\
    \"QueueName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"QueueQuickConnectConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a queue for a quick connect. The contact flow must be of type Transfer to Queue.</p>\"\
    },\
    \"QueueReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier of the queue.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a queue resource for which metrics are returned.</p>\"\
    },\
    \"QueueStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ENABLED\",\
        \"DISABLED\"\
      ]\
    },\
    \"QueueSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier of the queue.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the queue.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"QueueName\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"QueueType\":{\
          \"shape\":\"QueueType\",\
          \"documentation\":\"<p>The type of queue.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a queue.</p>\"\
    },\
    \"QueueSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueueSummary\"}\
    },\
    \"QueueType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STANDARD\",\
        \"AGENT\"\
      ]\
    },\
    \"QueueTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueueType\"},\
      \"max\":2\
    },\
    \"Queues\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueueId\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"QuickConnect\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"QuickConnectARN\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the quick connect.</p>\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"QuickConnectName\",\
          \"documentation\":\"<p>The name of the quick connect.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QuickConnectDescription\",\
          \"documentation\":\"<p>The description.</p>\"\
        },\
        \"QuickConnectConfig\":{\
          \"shape\":\"QuickConnectConfig\",\
          \"documentation\":\"<p>Contains information about the quick connect.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a quick connect.</p>\"\
    },\
    \"QuickConnectConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"QuickConnectType\"],\
      \"members\":{\
        \"QuickConnectType\":{\
          \"shape\":\"QuickConnectType\",\
          \"documentation\":\"<p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE). </p>\"\
        },\
        \"UserConfig\":{\
          \"shape\":\"UserQuickConnectConfig\",\
          \"documentation\":\"<p>The user configuration. This is required only if QuickConnectType is USER.</p>\"\
        },\
        \"QueueConfig\":{\
          \"shape\":\"QueueQuickConnectConfig\",\
          \"documentation\":\"<p>The queue configuration. This is required only if QuickConnectType is QUEUE.</p>\"\
        },\
        \"PhoneConfig\":{\
          \"shape\":\"PhoneNumberQuickConnectConfig\",\
          \"documentation\":\"<p>The phone configuration. This is required only if QuickConnectType is PHONE_NUMBER.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains configuration settings for a quick connect.</p>\"\
    },\
    \"QuickConnectDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"QuickConnectId\":{\"type\":\"string\"},\
    \"QuickConnectName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1\
    },\
    \"QuickConnectSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the quick connect.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"QuickConnectName\",\
          \"documentation\":\"<p>The name of the quick connect.</p>\"\
        },\
        \"QuickConnectType\":{\
          \"shape\":\"QuickConnectType\",\
          \"documentation\":\"<p>The type of quick connect. In the Amazon Connect console, when you create a quick connect, you are prompted to assign one of the following types: Agent (USER), External (PHONE_NUMBER), or Queue (QUEUE).</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a quick connect.</p>\"\
    },\
    \"QuickConnectSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QuickConnectSummary\"}\
    },\
    \"QuickConnectType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"USER\",\
        \"QUEUE\",\
        \"PHONE_NUMBER\"\
      ]\
    },\
    \"QuickConnectTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QuickConnectType\"},\
      \"max\":3\
    },\
    \"QuickConnectsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QuickConnectId\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"Reference\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Value\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>A valid value for the reference. For example, for a URL reference, a formatted URL that is displayed to an agent in the Contact Control Panel (CCP).</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"ReferenceType\",\
          \"documentation\":\"<p>The type of the reference. Only <code>URL</code> type can be added or updated on a contact.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A link that an agent selects to complete a given task. You can have up to 4,096 UTF-8 bytes across all references for a contact.</p>\"\
    },\
    \"ReferenceKey\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":1\
    },\
    \"ReferenceStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"APPROVED\",\
        \"REJECTED\"\
      ]\
    },\
    \"ReferenceSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Url\":{\
          \"shape\":\"UrlReference\",\
          \"documentation\":\"<p>Information about the URL reference if the <code>referenceType</code> is <code>URL</code>. Otherwise, null.</p>\"\
        },\
        \"Attachment\":{\
          \"shape\":\"AttachmentReference\",\
          \"documentation\":\"<p>Information about the attachment reference if the <code>referenceType</code> is <code>ATTACHMENT</code>. Otherwise, null.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a reference. <code>ReferenceSummary</code> contains only one non null field between the URL and attachment based on the reference type.</p>\",\
      \"union\":true\
    },\
    \"ReferenceSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReferenceSummary\"}\
    },\
    \"ReferenceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"URL\",\
        \"ATTACHMENT\"\
      ]\
    },\
    \"ReferenceTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ReferenceType\"},\
      \"max\":2\
    },\
    \"ReferenceValue\":{\
      \"type\":\"string\",\
      \"max\":4096,\
      \"min\":0\
    },\
    \"ReleasePhoneNumberRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"PhoneNumberId\"],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true,\
          \"location\":\"querystring\",\
          \"locationName\":\"clientToken\"\
        }\
      }\
    },\
    \"ResourceConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>A resource already has that name.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"},\
        \"ResourceType\":{\
          \"shape\":\"ResourceType\",\
          \"documentation\":\"<p>The type of resource.</p>\"\
        },\
        \"ResourceId\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The identifier for the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>That resource is already in use. Please try another.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>The message about the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The specified resource was not found.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"ResourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONTACT\",\
        \"CONTACT_FLOW\",\
        \"INSTANCE\",\
        \"PARTICIPANT\",\
        \"HIERARCHY_LEVEL\",\
        \"HIERARCHY_GROUP\",\
        \"USER\"\
      ]\
    },\
    \"ResumeContactRecordingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"InitialContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        }\
      }\
    },\
    \"ResumeContactRecordingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"RoutingProfile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"RoutingProfileName\",\
          \"documentation\":\"<p>The name of the routing profile.</p>\"\
        },\
        \"RoutingProfileArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the routing profile.</p>\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"RoutingProfileDescription\",\
          \"documentation\":\"<p>The description of the routing profile.</p>\"\
        },\
        \"MediaConcurrencies\":{\
          \"shape\":\"MediaConcurrencies\",\
          \"documentation\":\"<p>The channels agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>\"\
        },\
        \"DefaultOutboundQueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier of the default outbound queue for this routing profile.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>One or more tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a routing profile.</p>\"\
    },\
    \"RoutingProfileDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":1\
    },\
    \"RoutingProfileId\":{\"type\":\"string\"},\
    \"RoutingProfileName\":{\
      \"type\":\"string\",\
      \"max\":127,\
      \"min\":1\
    },\
    \"RoutingProfileQueueConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueReference\",\
        \"Priority\",\
        \"Delay\"\
      ],\
      \"members\":{\
        \"QueueReference\":{\
          \"shape\":\"RoutingProfileQueueReference\",\
          \"documentation\":\"<p>Contains information about a queue resource.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"Priority\",\
          \"documentation\":\"<p>The order in which contacts are to be handled for the queue. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html\\\">Queues: priority and delay</a>.</p>\",\
          \"box\":true\
        },\
        \"Delay\":{\
          \"shape\":\"Delay\",\
          \"documentation\":\"<p>The delay, in seconds, a contact should be in the queue before they are routed to an available agent. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html\\\">Queues: priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains information about the queue and channel for which priority and delay can be set.</p>\"\
    },\
    \"RoutingProfileQueueConfigList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileQueueConfig\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"RoutingProfileQueueConfigSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueId\",\
        \"QueueArn\",\
        \"QueueName\",\
        \"Priority\",\
        \"Delay\",\
        \"Channel\"\
      ],\
      \"members\":{\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"QueueArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the queue.</p>\"\
        },\
        \"QueueName\":{\
          \"shape\":\"QueueName\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"Priority\":{\
          \"shape\":\"Priority\",\
          \"documentation\":\"<p>The order in which contacts are to be handled for the queue. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html\\\">Queues: priority and delay</a>.</p>\"\
        },\
        \"Delay\":{\
          \"shape\":\"Delay\",\
          \"documentation\":\"<p>The delay, in seconds, that a contact should be in the queue before they are routed to an available agent. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/concepts-routing-profiles-priority.html\\\">Queues: priority and delay</a> in the <i>Amazon Connect Administrator Guide</i>.</p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channels this queue supports.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a routing profile queue.</p>\"\
    },\
    \"RoutingProfileQueueConfigSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileQueueConfigSummary\"}\
    },\
    \"RoutingProfileQueueReference\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"QueueId\",\
        \"Channel\"\
      ],\
      \"members\":{\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\"\
        },\
        \"Channel\":{\
          \"shape\":\"Channel\",\
          \"documentation\":\"<p>The channels agents can handle in the Contact Control Panel (CCP) for this routing profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the channel and queue identifier for a routing profile.</p>\"\
    },\
    \"RoutingProfileQueueReferenceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileQueueReference\"}\
    },\
    \"RoutingProfileSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the routing profile.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"RoutingProfileName\",\
          \"documentation\":\"<p>The name of the routing profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a routing profile.</p>\"\
    },\
    \"RoutingProfileSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RoutingProfileSummary\"}\
    },\
    \"S3Config\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"BucketName\",\
        \"BucketPrefix\"\
      ],\
      \"members\":{\
        \"BucketName\":{\
          \"shape\":\"BucketName\",\
          \"documentation\":\"<p>The S3 bucket name.</p>\"\
        },\
        \"BucketPrefix\":{\
          \"shape\":\"Prefix\",\
          \"documentation\":\"<p>The S3 bucket prefix.</p>\"\
        },\
        \"EncryptionConfig\":{\
          \"shape\":\"EncryptionConfig\",\
          \"documentation\":\"<p>The Amazon S3 encryption configuration.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the Amazon Simple Storage Service (Amazon S3) storage type.</p>\"\
    },\
    \"SearchAvailablePhoneNumbersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TargetArn\",\
        \"PhoneNumberCountryCode\",\
        \"PhoneNumberType\"\
      ],\
      \"members\":{\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>\"\
        },\
        \"PhoneNumberCountryCode\":{\
          \"shape\":\"PhoneNumberCountryCode\",\
          \"documentation\":\"<p>The ISO country code.</p>\"\
        },\
        \"PhoneNumberType\":{\
          \"shape\":\"PhoneNumberType\",\
          \"documentation\":\"<p>The type of phone number.</p>\"\
        },\
        \"PhoneNumberPrefix\":{\
          \"shape\":\"PhoneNumberPrefix\",\
          \"documentation\":\"<p>The prefix of the phone number. If provided, it must contain <code>+</code> as part of the country code.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult10\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"NextToken\":{\
          \"shape\":\"LargeNextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        }\
      }\
    },\
    \"SearchAvailablePhoneNumbersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"LargeNextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"AvailableNumbersList\":{\
          \"shape\":\"AvailableNumbersList\",\
          \"documentation\":\"<p>A list of available phone numbers that you can claim for your Amazon Connect instance.</p>\"\
        }\
      }\
    },\
    \"SearchUsersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\",\
          \"box\":true\
        },\
        \"SearchFilter\":{\
          \"shape\":\"UserSearchFilter\",\
          \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
        },\
        \"SearchCriteria\":{\"shape\":\"UserSearchCriteria\"}\
      }\
    },\
    \"SearchUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Users\":{\
          \"shape\":\"UserSearchSummaryList\",\
          \"documentation\":\"<p>Information about the users.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken2500\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        },\
        \"ApproximateTotalCount\":{\
          \"shape\":\"ApproximateTotalCount\",\
          \"documentation\":\"<p>The total number of users who matched your search query.</p>\"\
        }\
      }\
    },\
    \"SearchVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"InstanceId\"],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResult100\",\
          \"documentation\":\"<p>The maximum number of results to return per page.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"VocabularyNextToken\",\
          \"documentation\":\"<p>The token for the next set of results. Use the value returned in the previous response in the next request to retrieve the next set of results.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        },\
        \"NameStartsWith\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The starting pattern of the name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        }\
      }\
    },\
    \"SearchVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularySummaryList\":{\
          \"shape\":\"VocabularySummaryList\",\
          \"documentation\":\"<p>The list of the available custom vocabularies.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"VocabularyNextToken\",\
          \"documentation\":\"<p>If there are additional results, this is the token for the next set of results.</p>\"\
        }\
      }\
    },\
    \"SecurityKey\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\"\
        },\
        \"Key\":{\
          \"shape\":\"PEM\",\
          \"documentation\":\"<p>The key of the security key.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"timestamp\",\
          \"documentation\":\"<p>When the security key was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Configuration information of the security key.</p>\"\
    },\
    \"SecurityKeysList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityKey\"}\
    },\
    \"SecurityProfile\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profile.</p>\"\
        },\
        \"OrganizationResourceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The organization resource identifier for the security profile.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the secruity profile.</p>\"\
        },\
        \"SecurityProfileName\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name for the security profile.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>The description of the security profile.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a security profile.</p>\"\
    },\
    \"SecurityProfileDescription\":{\
      \"type\":\"string\",\
      \"max\":250\
    },\
    \"SecurityProfileId\":{\"type\":\"string\"},\
    \"SecurityProfileIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileId\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"SecurityProfileName\":{\"type\":\"string\"},\
    \"SecurityProfilePermission\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"SecurityProfileSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier of the security profile.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the security profile.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SecurityProfileName\",\
          \"documentation\":\"<p>The name of the security profile.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a security profile.</p>\"\
    },\
    \"SecurityProfileSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityProfileSummary\"}\
    },\
    \"SecurityToken\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"ServiceQuotaExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The service quota has been exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":402},\
      \"exception\":true\
    },\
    \"SourceApplicationName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9_ -]+$\"\
    },\
    \"SourceType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SALESFORCE\",\
        \"ZENDESK\"\
      ]\
    },\
    \"StartChatContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\",\
        \"ParticipantDetails\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow for initiating the chat. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the contact flow. On the contact flow page, under the name of the contact flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p> <p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b> </p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes. They can be accessed in contact flows just like any other contact attributes. </p> <p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>\"\
        },\
        \"ParticipantDetails\":{\
          \"shape\":\"ParticipantDetails\",\
          \"documentation\":\"<p>Information identifying the participant.</p>\"\
        },\
        \"InitialMessage\":{\
          \"shape\":\"ChatMessage\",\
          \"documentation\":\"<p>The initial message to be sent to the newly created chat.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ChatDurationInMinutes\":{\
          \"shape\":\"ChatDurationInMinutes\",\
          \"documentation\":\"<p>The total duration of the newly started chat session. If not specified, the chat session duration defaults to 25 hour. The minumum configurable time is 60 minutes. The maximum configurable time is 10,080 minutes (7 days).</p>\"\
        },\
        \"SupportedMessagingContentTypes\":{\
          \"shape\":\"SupportedMessagingContentTypes\",\
          \"documentation\":\"<p>The supported chat message content types. Content types can be text/plain or both text/plain and text/markdown.</p>\"\
        }\
      }\
    },\
    \"StartChatContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of this contact within the Amazon Connect instance. </p>\"\
        },\
        \"ParticipantId\":{\
          \"shape\":\"ParticipantId\",\
          \"documentation\":\"<p>The identifier for a chat participant. The participantId for a chat participant is the same throughout the chat lifecycle.</p>\"\
        },\
        \"ParticipantToken\":{\
          \"shape\":\"ParticipantToken\",\
          \"documentation\":\"<p>The token used by the chat participant to call <a href=\\\"https://docs.aws.amazon.com/connect-participant/latest/APIReference/API_CreateParticipantConnection.html\\\">CreateParticipantConnection</a>. The participant token is valid for the lifetime of a chat participant.</p>\"\
        }\
      }\
    },\
    \"StartContactRecordingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"InitialContactId\",\
        \"VoiceRecordingConfiguration\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        },\
        \"VoiceRecordingConfiguration\":{\
          \"shape\":\"VoiceRecordingConfiguration\",\
          \"documentation\":\"<p>The person being recorded.</p>\"\
        }\
      }\
    },\
    \"StartContactRecordingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StartContactStreamingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ChatStreamingConfiguration\",\
        \"ClientToken\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        },\
        \"ChatStreamingConfiguration\":{\
          \"shape\":\"ChatStreamingConfiguration\",\
          \"documentation\":\"<p>The streaming configuration, such as the Amazon SNS streaming endpoint.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"StartContactStreamingResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"StreamingId\"],\
      \"members\":{\
        \"StreamingId\":{\
          \"shape\":\"StreamingId\",\
          \"documentation\":\"<p>The identifier of the streaming configuration enabled. </p>\"\
        }\
      }\
    },\
    \"StartOutboundVoiceContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DestinationPhoneNumber\",\
        \"ContactFlowId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"DestinationPhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number of the customer, in E.164 format.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow for the outbound call. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the contact flow. On the contact flow page, under the name of the contact flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p> <p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b> </p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. The token is valid for 7 days after creation. If a contact is already started, the contact ID is returned. </p>\",\
          \"idempotencyToken\":true\
        },\
        \"SourcePhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number associated with the Amazon Connect instance, in E.164 format. If you do not specify a source phone number, you must specify a queue.</p>\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The queue for the call. If you specify a queue, the phone displayed for caller ID is the phone number specified in the queue. If you do not specify a queue, the queue defined in the contact flow is used. If you do not specify a queue, you must specify a source phone number.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in contact flows just like any other contact attributes.</p> <p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>\"\
        },\
        \"AnswerMachineDetectionConfig\":{\
          \"shape\":\"AnswerMachineDetectionConfig\",\
          \"documentation\":\"<p>Configuration of the answering machine detection for this outbound call. </p>\"\
        },\
        \"CampaignId\":{\
          \"shape\":\"CampaignId\",\
          \"documentation\":\"<p>The campaign identifier of the outbound communication.</p>\"\
        },\
        \"TrafficType\":{\
          \"shape\":\"TrafficType\",\
          \"documentation\":\"<p>Denotes the class of traffic. Calls with different traffic types are handled differently by Amazon Connect. The default value is <code>GENERAL</code>. Use <code>CAMPAIGN</code> if <code>EnableAnswerMachineDetection</code> is set to <code>true</code>. For all other cases, use <code>GENERAL</code>. </p>\"\
        }\
      }\
    },\
    \"StartOutboundVoiceContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of this contact within the Amazon Connect instance.</p>\"\
        }\
      }\
    },\
    \"StartTaskContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"PreviousContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the previous chat, voice, or task contact. </p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow for initiating the tasks. To see the ContactFlowId in the Amazon Connect console user interface, on the navigation menu go to <b>Routing</b>, <b>Contact Flows</b>. Choose the contact flow. On the contact flow page, under the name of the contact flow, choose <b>Show additional flow information</b>. The ContactFlowId is the last part of the ARN, shown here in bold: </p> <p>arn:aws:connect:us-west-2:xxxxxxxxxxxx:instance/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/contact-flow/<b>846ec553-a005-41c0-8341-xxxxxxxxxxxx</b> </p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>A custom key-value pair using an attribute map. The attributes are standard Amazon Connect attributes, and can be accessed in contact flows just like any other contact attributes.</p> <p>There can be up to 32,768 UTF-8 bytes across all key-value pairs per contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of a task that is shown to an agent in the Contact Control Panel (CCP).</p>\"\
        },\
        \"References\":{\
          \"shape\":\"ContactReferences\",\
          \"documentation\":\"<p>A formatted URL that is shown to an agent in the Contact Control Panel (CCP).</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A description of the task that is shown to an agent in the Contact Control Panel (CCP).</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"ScheduledTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp, in Unix Epoch seconds format, at which to start running the inbound contact flow. The scheduled time cannot be in the past. It must be within up to 6 days in future. </p>\"\
        }\
      }\
    },\
    \"StartTaskContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of this contact within the Amazon Connect instance.</p>\"\
        }\
      }\
    },\
    \"Statistic\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUM\",\
        \"MAX\",\
        \"AVG\"\
      ]\
    },\
    \"StopContactRecordingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"InitialContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        }\
      }\
    },\
    \"StopContactRecordingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StopContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ContactId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The ID of the contact.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        }\
      }\
    },\
    \"StopContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StopContactStreamingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"StreamingId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact that is associated with the first interaction with the contact center.</p>\"\
        },\
        \"StreamingId\":{\
          \"shape\":\"StreamingId\",\
          \"documentation\":\"<p>The identifier of the streaming configuration enabled. </p>\"\
        }\
      }\
    },\
    \"StopContactStreamingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StorageType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"S3\",\
        \"KINESIS_VIDEO_STREAM\",\
        \"KINESIS_STREAM\",\
        \"KINESIS_FIREHOSE\"\
      ]\
    },\
    \"StreamingId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringComparisonType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STARTS_WITH\",\
        \"CONTAINS\",\
        \"EXACT\"\
      ]\
    },\
    \"StringCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FieldName\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the field in the string condition.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The value of the string.</p>\"\
        },\
        \"ComparisonType\":{\
          \"shape\":\"StringComparisonType\",\
          \"documentation\":\"<p>The type of comparison to be made when evaluating the string condition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition, for example, <code>username = 'abc'</code>. </p>\"\
    },\
    \"SupportedMessagingContentType\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"SupportedMessagingContentTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SupportedMessagingContentType\"}\
    },\
    \"SuspendContactRecordingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"InitialContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        }\
      }\
    },\
    \"SuspendContactRecordingResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagAndConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagCondition\"}\
    },\
    \"TagCondition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagKey\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag key in the tag condition.</p>\"\
        },\
        \"TagValue\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The tag value in the tag condition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A leaf node condition which can be used to specify a tag condition, for example, <code>HAVE BPO = 123</code>. </p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^(?!aws:)[a-zA-Z+-=._:/]+$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagOrConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagAndConditionList\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>One or more tags. For example, { \\\"tags\\\": {\\\"key1\\\":\\\"value1\\\", \\\"key2\\\":\\\"value2\\\"} }.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"Threshold\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Comparison\":{\
          \"shape\":\"Comparison\",\
          \"documentation\":\"<p>The type of comparison. Only \\\"less than\\\" (LT) comparisons are supported.</p>\"\
        },\
        \"ThresholdValue\":{\
          \"shape\":\"ThresholdValue\",\
          \"documentation\":\"<p>The threshold value to compare.</p>\",\
          \"box\":true\
        }\
      },\
      \"documentation\":\"<p>Contains information about the threshold for service level metrics.</p>\"\
    },\
    \"ThresholdValue\":{\"type\":\"double\"},\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>The throttling limit has been exceeded.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"TimeZone\":{\"type\":\"string\"},\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TrafficType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"GENERAL\",\
        \"CAMPAIGN\"\
      ]\
    },\
    \"URI\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"Unit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SECONDS\",\
        \"COUNT\",\
        \"PERCENT\"\
      ]\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tagKeys\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"resourceArn\"\
        },\
        \"tagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      }\
    },\
    \"UpdateAgentStatusDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":0\
    },\
    \"UpdateAgentStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AgentStatusId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AgentStatusId\":{\
          \"shape\":\"AgentStatusId\",\
          \"documentation\":\"<p>The identifier of the agent status.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AgentStatusId\"\
        },\
        \"Name\":{\
          \"shape\":\"AgentStatusName\",\
          \"documentation\":\"<p>The name of the agent status.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"UpdateAgentStatusDescription\",\
          \"documentation\":\"<p>The description of the agent status.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"AgentStatusState\",\
          \"documentation\":\"<p>The state of the agent status.</p>\"\
        },\
        \"DisplayOrder\":{\
          \"shape\":\"AgentStatusOrderNumber\",\
          \"documentation\":\"<p>The display order of the agent status.</p>\",\
          \"box\":true\
        },\
        \"ResetOrderNumber\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A number indicating the reset order of the agent status.</p>\"\
        }\
      }\
    },\
    \"UpdateContactAttributesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InitialContactId\",\
        \"InstanceId\",\
        \"Attributes\"\
      ],\
      \"members\":{\
        \"InitialContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with the contact center.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"Attributes\":{\
          \"shape\":\"Attributes\",\
          \"documentation\":\"<p>The Amazon Connect attributes. These attributes can be accessed in contact flows just like any other contact attributes.</p> <p>You can have up to 32,768 UTF-8 bytes across all attributes for a contact. Attribute keys can include only alphanumeric, dash, and underscore characters.</p>\"\
        }\
      }\
    },\
    \"UpdateContactAttributesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactFlowContentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowContent\",\
          \"documentation\":\"<p>The JSON string that represents contact flowâs content. For an example, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/flow-language-example.html\\\">Example contact flow in Amazon Connect Flow language</a> in the <i>Amazon Connect Administrator Guide</i>. </p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowMetadataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>TThe name of the contact flow.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowDescription\",\
          \"documentation\":\"<p>The description of the contact flow.</p>\"\
        },\
        \"ContactFlowState\":{\
          \"shape\":\"ContactFlowState\",\
          \"documentation\":\"<p>The state of contact flow.</p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowModuleContentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowModuleId\",\
        \"Content\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowModuleId\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the contact flow module.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowModuleId\"\
        },\
        \"Content\":{\
          \"shape\":\"ContactFlowModuleContent\",\
          \"documentation\":\"<p>The content of the contact flow module.</p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowModuleContentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactFlowModuleMetadataRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowModuleId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowModuleId\":{\
          \"shape\":\"ContactFlowModuleId\",\
          \"documentation\":\"<p>The identifier of the contact flow module.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowModuleId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowModuleName\",\
          \"documentation\":\"<p>The name of the contact flow module.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowModuleDescription\",\
          \"documentation\":\"<p>The description of the contact flow module.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"ContactFlowModuleState\",\
          \"documentation\":\"<p>The state of contact flow module.</p>\"\
        }\
      }\
    },\
    \"UpdateContactFlowModuleMetadataResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactFlowNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactFlowId\"\
        },\
        \"Name\":{\
          \"shape\":\"ContactFlowName\",\
          \"documentation\":\"<p>The name of the contact flow.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ContactFlowDescription\",\
          \"documentation\":\"<p>The description of the contact flow.</p>\"\
        }\
      }\
    },\
    \"UpdateContactRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact. This is the identifier of the contact associated with the first interaction with your contact center.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ContactId\"\
        },\
        \"Name\":{\
          \"shape\":\"Name\",\
          \"documentation\":\"<p>The name of the contact.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The description of the contact.</p>\"\
        },\
        \"References\":{\
          \"shape\":\"ContactReferences\",\
          \"documentation\":\"<p>A formatted URL that is shown to an agent in the Contact Control Panel (CCP).</p>\"\
        }\
      }\
    },\
    \"UpdateContactResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateContactScheduleRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"ContactId\",\
        \"ScheduledTime\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\"\
        },\
        \"ContactId\":{\
          \"shape\":\"ContactId\",\
          \"documentation\":\"<p>The identifier of the contact.</p>\"\
        },\
        \"ScheduledTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp, in Unix Epoch seconds format, at which to start running the inbound contact flow. The scheduled time cannot be in the past. It must be within up to 6 days in future. </p>\"\
        }\
      }\
    },\
    \"UpdateContactScheduleResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateHoursOfOperationDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":0\
    },\
    \"UpdateHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier of the hours of operation.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HoursOfOperationId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the hours of operation.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"UpdateHoursOfOperationDescription\",\
          \"documentation\":\"<p>The description of the hours of operation.</p>\"\
        },\
        \"TimeZone\":{\
          \"shape\":\"TimeZone\",\
          \"documentation\":\"<p>The time zone of the hours of operation.</p>\"\
        },\
        \"Config\":{\
          \"shape\":\"HoursOfOperationConfigList\",\
          \"documentation\":\"<p>Configuration information of the hours of operation.</p>\"\
        }\
      }\
    },\
    \"UpdateInstanceAttributeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AttributeType\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AttributeType\":{\
          \"shape\":\"InstanceAttributeType\",\
          \"documentation\":\"<p>The type of attribute.</p> <note> <p>Only allowlisted customers can consume USE_CUSTOM_TTS_VOICES. To access this feature, contact Amazon Web Services Support for allowlisting.</p> </note>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AttributeType\"\
        },\
        \"Value\":{\
          \"shape\":\"InstanceAttributeValue\",\
          \"documentation\":\"<p>The value for the attribute. Maximum character limit is 100. </p>\"\
        }\
      }\
    },\
    \"UpdateInstanceStorageConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"AssociationId\",\
        \"ResourceType\",\
        \"StorageConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"AssociationId\":{\
          \"shape\":\"AssociationId\",\
          \"documentation\":\"<p>The existing association identifier that uniquely identifies the resource type and storage config for the given instance ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"AssociationId\"\
        },\
        \"ResourceType\":{\
          \"shape\":\"InstanceStorageResourceType\",\
          \"documentation\":\"<p>A valid resource type.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"resourceType\"\
        },\
        \"StorageConfig\":{\"shape\":\"InstanceStorageConfig\"}\
      }\
    },\
    \"UpdatePhoneNumberRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PhoneNumberId\",\
        \"TargetArn\"\
      ],\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"PhoneNumberId\"\
        },\
        \"TargetArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for Amazon Connect instances that phone numbers are claimed to.</p>\"\
        },\
        \"ClientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"UpdatePhoneNumberResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PhoneNumberId\":{\
          \"shape\":\"PhoneNumberId\",\
          \"documentation\":\"<p>A unique identifier for the phone number.</p>\"\
        },\
        \"PhoneNumberArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the phone number.</p>\"\
        }\
      }\
    },\
    \"UpdateQueueHoursOfOperationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"HoursOfOperationId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"HoursOfOperationId\":{\
          \"shape\":\"HoursOfOperationId\",\
          \"documentation\":\"<p>The identifier for the hours of operation.</p>\"\
        }\
      }\
    },\
    \"UpdateQueueMaxContactsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"MaxContacts\":{\
          \"shape\":\"QueueMaxContacts\",\
          \"documentation\":\"<p>The maximum number of contacts that can be in the queue before it is considered full.</p>\",\
          \"box\":true\
        }\
      }\
    },\
    \"UpdateQueueNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"Name\":{\
          \"shape\":\"CommonNameLength127\",\
          \"documentation\":\"<p>The name of the queue.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"QueueDescription\",\
          \"documentation\":\"<p>The description of the queue.</p>\"\
        }\
      }\
    },\
    \"UpdateQueueOutboundCallerConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"OutboundCallerConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"OutboundCallerConfig\":{\
          \"shape\":\"OutboundCallerConfig\",\
          \"documentation\":\"<p>The outbound caller ID name, number, and outbound whisper flow.</p>\"\
        }\
      }\
    },\
    \"UpdateQueueStatusRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QueueId\",\
        \"Status\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the queue.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QueueId\"\
        },\
        \"Status\":{\
          \"shape\":\"QueueStatus\",\
          \"documentation\":\"<p>The status of the queue.</p>\"\
        }\
      }\
    },\
    \"UpdateQuickConnectConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QuickConnectId\",\
        \"QuickConnectConfig\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QuickConnectId\"\
        },\
        \"QuickConnectConfig\":{\
          \"shape\":\"QuickConnectConfig\",\
          \"documentation\":\"<p>Information about the configuration settings for the quick connect.</p>\"\
        }\
      }\
    },\
    \"UpdateQuickConnectDescription\":{\
      \"type\":\"string\",\
      \"max\":250,\
      \"min\":0\
    },\
    \"UpdateQuickConnectNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"QuickConnectId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"QuickConnectId\":{\
          \"shape\":\"QuickConnectId\",\
          \"documentation\":\"<p>The identifier for the quick connect.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"QuickConnectId\"\
        },\
        \"Name\":{\
          \"shape\":\"QuickConnectName\",\
          \"documentation\":\"<p>The name of the quick connect.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"UpdateQuickConnectDescription\",\
          \"documentation\":\"<p>The description of the quick connect.</p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileConcurrencyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"MediaConcurrencies\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"MediaConcurrencies\":{\
          \"shape\":\"MediaConcurrencies\",\
          \"documentation\":\"<p>The channels that agents can handle in the Contact Control Panel (CCP).</p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileDefaultOutboundQueueRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"DefaultOutboundQueueId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"DefaultOutboundQueueId\":{\
          \"shape\":\"QueueId\",\
          \"documentation\":\"<p>The identifier for the default outbound queue.</p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"Name\":{\
          \"shape\":\"RoutingProfileName\",\
          \"documentation\":\"<p>The name of the routing profile. Must not be more than 127 characters.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"RoutingProfileDescription\",\
          \"documentation\":\"<p>The description of the routing profile. Must not be more than 250 characters.</p>\"\
        }\
      }\
    },\
    \"UpdateRoutingProfileQueuesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InstanceId\",\
        \"RoutingProfileId\",\
        \"QueueConfigs\"\
      ],\
      \"members\":{\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"RoutingProfileId\"\
        },\
        \"QueueConfigs\":{\
          \"shape\":\"RoutingProfileQueueConfigList\",\
          \"documentation\":\"<p>The queues to be updated for this routing profile. Queues must first be associated to the routing profile. You can do this using AssociateRoutingProfileQueues.</p>\"\
        }\
      }\
    },\
    \"UpdateSecurityProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"SecurityProfileDescription\",\
          \"documentation\":\"<p>The description of the security profile.</p>\"\
        },\
        \"Permissions\":{\
          \"shape\":\"PermissionsList\",\
          \"documentation\":\"<p>The permissions granted to a security profile.</p>\"\
        },\
        \"SecurityProfileId\":{\
          \"shape\":\"SecurityProfileId\",\
          \"documentation\":\"<p>The identifier for the security profle.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"SecurityProfileId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserHierarchyGroupNameRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"HierarchyGroupId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"HierarchyGroupName\",\
          \"documentation\":\"<p>The name of the hierarchy group. Must not be more than 100 characters.</p>\"\
        },\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"HierarchyGroupId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserHierarchyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserHierarchyStructureRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"HierarchyStructure\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"HierarchyStructure\":{\
          \"shape\":\"HierarchyStructureUpdate\",\
          \"documentation\":\"<p>The hierarchy levels to update.</p>\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserIdentityInfoRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IdentityInfo\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"IdentityInfo\":{\
          \"shape\":\"UserIdentityInfo\",\
          \"documentation\":\"<p>The identity information for the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserPhoneConfigRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PhoneConfig\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"PhoneConfig\":{\
          \"shape\":\"UserPhoneConfig\",\
          \"documentation\":\"<p>Information about phone configuration settings for the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserRoutingProfileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RoutingProfileId\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile for the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UpdateUserSecurityProfilesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityProfileIds\",\
        \"UserId\",\
        \"InstanceId\"\
      ],\
      \"members\":{\
        \"SecurityProfileIds\":{\
          \"shape\":\"SecurityProfileIds\",\
          \"documentation\":\"<p>The identifiers of the security profiles for the user.</p>\"\
        },\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UserId\"\
        },\
        \"InstanceId\":{\
          \"shape\":\"InstanceId\",\
          \"documentation\":\"<p>The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the instance.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"InstanceId\"\
        }\
      }\
    },\
    \"UrlReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"ReferenceKey\",\
          \"documentation\":\"<p>Identifier of the URL reference.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"ReferenceValue\",\
          \"documentation\":\"<p>A valid URL.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The URL reference.</p>\"\
    },\
    \"UseCase\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UseCaseId\":{\
          \"shape\":\"UseCaseId\",\
          \"documentation\":\"<p>The identifier for the use case.</p>\"\
        },\
        \"UseCaseArn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the use case.</p>\"\
        },\
        \"UseCaseType\":{\
          \"shape\":\"UseCaseType\",\
          \"documentation\":\"<p>The type of use case to associate to the integration association. Each integration association can have only one of each use case type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the use case.</p>\"\
    },\
    \"UseCaseId\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1\
    },\
    \"UseCaseSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UseCase\"}\
    },\
    \"UseCaseType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RULES_EVALUATION\",\
        \"CONNECT_CAMPAIGNS\"\
      ]\
    },\
    \"User\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user account.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"AgentUsername\",\
          \"documentation\":\"<p>The user name assigned to the user account.</p>\"\
        },\
        \"IdentityInfo\":{\
          \"shape\":\"UserIdentityInfo\",\
          \"documentation\":\"<p>Information about the user identity.</p>\"\
        },\
        \"PhoneConfig\":{\
          \"shape\":\"UserPhoneConfig\",\
          \"documentation\":\"<p>Information about the phone configuration for the user.</p>\"\
        },\
        \"DirectoryUserId\":{\
          \"shape\":\"DirectoryUserId\",\
          \"documentation\":\"<p>The identifier of the user account in the directory used for identity management.</p>\"\
        },\
        \"SecurityProfileIds\":{\
          \"shape\":\"SecurityProfileIds\",\
          \"documentation\":\"<p>The identifiers of the security profiles for the user.</p>\"\
        },\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the routing profile for the user.</p>\"\
        },\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the hierarchy group for the user.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a user account for a Amazon Connect instance.</p>\"\
    },\
    \"UserId\":{\"type\":\"string\"},\
    \"UserIdentityInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FirstName\":{\
          \"shape\":\"AgentFirstName\",\
          \"documentation\":\"<p>The first name. This is required if you are using Amazon Connect or SAML for identity management.</p>\"\
        },\
        \"LastName\":{\
          \"shape\":\"AgentLastName\",\
          \"documentation\":\"<p>The last name. This is required if you are using Amazon Connect or SAML for identity management.</p>\"\
        },\
        \"Email\":{\
          \"shape\":\"Email\",\
          \"documentation\":\"<p>The email address. If you are using SAML for identity management and include this parameter, an error is returned.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the identity of a user.</p>\"\
    },\
    \"UserIdentityInfoLite\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FirstName\":{\
          \"shape\":\"AgentFirstName\",\
          \"documentation\":\"<p>The user's first name.</p>\"\
        },\
        \"LastName\":{\
          \"shape\":\"AgentLastName\",\
          \"documentation\":\"<p>The user's last name.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The user's first name and last name.</p>\"\
    },\
    \"UserNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>No user with the specified credentials was found in the Amazon Connect instance.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"UserPhoneConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"PhoneType\"],\
      \"members\":{\
        \"PhoneType\":{\
          \"shape\":\"PhoneType\",\
          \"documentation\":\"<p>The phone type.</p>\"\
        },\
        \"AutoAccept\":{\
          \"shape\":\"AutoAccept\",\
          \"documentation\":\"<p>The Auto accept setting.</p>\"\
        },\
        \"AfterContactWorkTimeLimit\":{\
          \"shape\":\"AfterContactWorkTimeLimit\",\
          \"documentation\":\"<p>The After Call Work (ACW) timeout setting, in seconds.</p>\"\
        },\
        \"DeskPhoneNumber\":{\
          \"shape\":\"PhoneNumber\",\
          \"documentation\":\"<p>The phone number for the user's desk phone.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the phone configuration settings for a user.</p>\"\
    },\
    \"UserQuickConnectConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"UserId\",\
        \"ContactFlowId\"\
      ],\
      \"members\":{\
        \"UserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user.</p>\"\
        },\
        \"ContactFlowId\":{\
          \"shape\":\"ContactFlowId\",\
          \"documentation\":\"<p>The identifier of the contact flow.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the quick connect configuration settings for a user. The contact flow must be of type Transfer to Agent.</p>\"\
    },\
    \"UserSearchConditionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserSearchCriteria\"}\
    },\
    \"UserSearchCriteria\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"OrConditions\":{\
          \"shape\":\"UserSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an <code>OR</code> condition.</p>\"\
        },\
        \"AndConditions\":{\
          \"shape\":\"UserSearchConditionList\",\
          \"documentation\":\"<p>A list of conditions which would be applied together with an <code>AND</code> condition. </p>\"\
        },\
        \"StringCondition\":{\
          \"shape\":\"StringCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a string condition.</p>\"\
        },\
        \"HierarchyGroupCondition\":{\
          \"shape\":\"HierarchyGroupCondition\",\
          \"documentation\":\"<p>A leaf node condition which can be used to specify a hierarchy group condition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The search criteria to be used to return users.</p>\"\
    },\
    \"UserSearchFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TagFilter\":{\"shape\":\"ControlPlaneTagFilter\"}\
      },\
      \"documentation\":\"<p>Filters to be applied to search results.</p>\"\
    },\
    \"UserSearchSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user.</p>\"\
        },\
        \"DirectoryUserId\":{\
          \"shape\":\"DirectoryUserId\",\
          \"documentation\":\"<p>The directory identifier of the user.</p>\"\
        },\
        \"HierarchyGroupId\":{\
          \"shape\":\"HierarchyGroupId\",\
          \"documentation\":\"<p>The identifier of the user's hierarchy group.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user's summary.</p>\"\
        },\
        \"IdentityInfo\":{\
          \"shape\":\"UserIdentityInfoLite\",\
          \"documentation\":\"<p>The user's first name and last name.</p>\"\
        },\
        \"PhoneConfig\":{\"shape\":\"UserPhoneConfig\"},\
        \"RoutingProfileId\":{\
          \"shape\":\"RoutingProfileId\",\
          \"documentation\":\"<p>The identifier of the user's routing profile.</p>\"\
        },\
        \"SecurityProfileIds\":{\
          \"shape\":\"SecurityProfileIds\",\
          \"documentation\":\"<p>The identifiers of the user's security profiles.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"AgentUsername\",\
          \"documentation\":\"<p>The name of the user.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the returned users.</p>\"\
    },\
    \"UserSearchSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserSearchSummary\"}\
    },\
    \"UserSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The identifier of the user account.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the user account.</p>\"\
        },\
        \"Username\":{\
          \"shape\":\"AgentUsername\",\
          \"documentation\":\"<p>The Amazon Connect user name of the user account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about a user.</p>\"\
    },\
    \"UserSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"UserSummary\"}\
    },\
    \"Value\":{\"type\":\"double\"},\
    \"Vocabulary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Id\",\
        \"Arn\",\
        \"LanguageCode\",\
        \"State\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name of the custom vocabulary.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"VocabularyLastModifiedTime\",\
          \"documentation\":\"<p>The timestamp when the custom vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"VocabularyFailureReason\",\
          \"documentation\":\"<p>The reason why the custom vocabulary was not created.</p>\"\
        },\
        \"Content\":{\
          \"shape\":\"VocabularyContent\",\
          \"documentation\":\"<p>The content of the custom vocabulary in plain-text format with a table of values. Each row in the table represents a word or a phrase, described with <code>Phrase</code>, <code>IPA</code>, <code>SoundsLike</code>, and <code>DisplayAs</code> fields. Separate the fields with TAB characters. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html#create-vocabulary-table\\\">Create a custom vocabulary using a table</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags used to organize, track, or control access for this resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about a custom vocabulary.</p>\"\
    },\
    \"VocabularyContent\":{\
      \"type\":\"string\",\
      \"max\":60000,\
      \"min\":1\
    },\
    \"VocabularyFailureReason\":{\"type\":\"string\"},\
    \"VocabularyId\":{\
      \"type\":\"string\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"VocabularyLanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ar-AE\",\
        \"de-CH\",\
        \"de-DE\",\
        \"en-AB\",\
        \"en-AU\",\
        \"en-GB\",\
        \"en-IE\",\
        \"en-IN\",\
        \"en-US\",\
        \"en-WL\",\
        \"es-ES\",\
        \"es-US\",\
        \"fr-CA\",\
        \"fr-FR\",\
        \"hi-IN\",\
        \"it-IT\",\
        \"ja-JP\",\
        \"ko-KR\",\
        \"pt-BR\",\
        \"pt-PT\",\
        \"zh-CN\"\
      ]\
    },\
    \"VocabularyLastModifiedTime\":{\"type\":\"timestamp\"},\
    \"VocabularyName\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyNextToken\":{\
      \"type\":\"string\",\
      \"max\":131070,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"VocabularyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATION_IN_PROGRESS\",\
        \"ACTIVE\",\
        \"CREATION_FAILED\",\
        \"DELETE_IN_PROGRESS\"\
      ]\
    },\
    \"VocabularySummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"Id\",\
        \"Arn\",\
        \"LanguageCode\",\
        \"State\",\
        \"LastModifiedTime\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>A unique name of the custom vocabulary.</p>\"\
        },\
        \"Id\":{\
          \"shape\":\"VocabularyId\",\
          \"documentation\":\"<p>The identifier of the custom vocabulary.</p>\"\
        },\
        \"Arn\":{\
          \"shape\":\"ARN\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"VocabularyLanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-whatis.html\\\">What is Amazon Transcribe?</a> </p>\"\
        },\
        \"State\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The current state of the custom vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"VocabularyLastModifiedTime\",\
          \"documentation\":\"<p>The timestamp when the custom vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"VocabularyFailureReason\",\
          \"documentation\":\"<p>The reason why the custom vocabulary was not created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains summary information about the custom vocabulary.</p>\"\
    },\
    \"VocabularySummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularySummary\"}\
    },\
    \"VoiceRecordingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VoiceRecordingTrack\":{\
          \"shape\":\"VoiceRecordingTrack\",\
          \"documentation\":\"<p>Identifies which track is being recorded.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about the recording configuration settings.</p>\"\
    },\
    \"VoiceRecordingTrack\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"FROM_AGENT\",\
        \"TO_AGENT\",\
        \"ALL\"\
      ]\
    },\
    \"timestamp\":{\"type\":\"timestamp\"}\
  },\
  \"documentation\":\"<p>Amazon Connect is a cloud-based contact center solution that you use to set up and manage a customer contact center and provide reliable customer engagement at any scale.</p> <p>Amazon Connect provides metrics and real-time reporting that enable you to optimize contact routing. You can also resolve customer issues more efficiently by getting customers in touch with the appropriate agents.</p> <p>There are limits to the number of Amazon Connect resources that you can create. There are also limits to the number of requests that you can make per second. For more information, see <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/amazon-connect-service-limits.html\\\">Amazon Connect Service Quotas</a> in the <i>Amazon Connect Administrator Guide</i>.</p> <p>You can connect programmatically to an Amazon Web Services service by using an endpoint. For a list of Amazon Connect endpoints, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/connect_region.html\\\">Amazon Connect Endpoints</a>.</p> <note> <p>Working with contact flows? Check out the <a href=\\\"https://docs.aws.amazon.com/connect/latest/adminguide/flow-language.html\\\">Amazon Connect Flow language</a>.</p> </note>\"\
}\
";
}

@end
