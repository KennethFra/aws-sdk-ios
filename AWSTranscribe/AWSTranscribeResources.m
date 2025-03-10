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

#import "AWSTranscribeResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTranscribeResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTranscribeResources

+ (instancetype)sharedInstance {
    static AWSTranscribeResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSTranscribeResources new];
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
    \"apiVersion\":\"2017-10-26\",\
    \"endpointPrefix\":\"transcribe\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Transcribe Service\",\
    \"serviceId\":\"Transcribe\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"transcribe\",\
    \"targetPrefix\":\"Transcribe\",\
    \"uid\":\"transcribe-2017-10-26\"\
  },\
  \"operations\":{\
    \"CreateCallAnalyticsCategory\":{\
      \"name\":\"CreateCallAnalyticsCategory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateCallAnalyticsCategoryRequest\"},\
      \"output\":{\"shape\":\"CreateCallAnalyticsCategoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a call analytics category. Amazon Transcribe applies the conditions specified by your call analytics categories to your call analytics jobs. For each analytics category, you must create between 1 and 20 rules. For example, you can create a 'greeting' category with a rule that flags calls in which your agent does not use a specified phrase (for example: \\\"Please note this call may be recorded.\\\") in the first 15 seconds of the call. When you start a call analytics job, Amazon Transcribe applies all your existing call analytics categories to that job.</p>\"\
    },\
    \"CreateLanguageModel\":{\
      \"name\":\"CreateLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLanguageModelRequest\"},\
      \"output\":{\"shape\":\"CreateLanguageModelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom language model. When creating a new language model, you must specify if you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband (audio sample rates under 16,000 Hz) base model. You then include the S3 URI location of your training and tuning files, the language for the model, a unique name, and any tags you want associated with your model.</p>\"\
    },\
    \"CreateMedicalVocabulary\":{\
      \"name\":\"CreateMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom medical vocabulary.</p> <p>When creating a new medical vocabulary, you must upload a text file that contains your new entries, phrases, and terms into an S3 bucket. Note that this differs from , where you can include a list of terms within your request using the <code>Phrases</code> flag, as <code>CreateMedicalVocabulary</code> does not support the <code>Phrases</code> flag.</p> <p>For more information on creating a custom vocabulary text file, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary-create.html\\\">Creating a custom vocabulary</a>.</p>\"\
    },\
    \"CreateVocabulary\":{\
      \"name\":\"CreateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom vocabulary.</p> <p>When creating a new medical vocabulary, you can either upload a text file that contains your new entries, phrases, and terms into an S3 bucket or include a list of terms directly in your request using the <code>Phrases</code> flag.</p> <p>For more information on creating a custom vocabulary, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary-create.html\\\">Creating a custom vocabulary</a>.</p>\"\
    },\
    \"CreateVocabularyFilter\":{\
      \"name\":\"CreateVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new vocabulary filter that you can use to filter words from your transcription output. For example, you can use this operation to remove profanity from your transcript.</p>\"\
    },\
    \"DeleteCallAnalyticsCategory\":{\
      \"name\":\"DeleteCallAnalyticsCategory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCallAnalyticsCategoryRequest\"},\
      \"output\":{\"shape\":\"DeleteCallAnalyticsCategoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a call analytics category. To use this operation, specify the name of the category you want to delete using <code>CategoryName</code>.</p>\"\
    },\
    \"DeleteCallAnalyticsJob\":{\
      \"name\":\"DeleteCallAnalyticsJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteCallAnalyticsJobRequest\"},\
      \"output\":{\"shape\":\"DeleteCallAnalyticsJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a call analytics job. To use this operation, specify the name of the job you want to delete using <code>CallAnalyticsJobName</code>.</p>\"\
    },\
    \"DeleteLanguageModel\":{\
      \"name\":\"DeleteLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLanguageModelRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom language model. To use this operation, specify the name of the language model you want to delete using <code>ModelName</code>.</p>\"\
    },\
    \"DeleteMedicalTranscriptionJob\":{\
      \"name\":\"DeleteMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMedicalTranscriptionJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a medical transcription job, along with any related information. To use this operation, specify the name of the job you want to delete using <code>MedicalTranscriptionJobName</code>.</p>\"\
    },\
    \"DeleteMedicalVocabulary\":{\
      \"name\":\"DeleteMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMedicalVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom medical vocabulary. To use this operation, specify the name of the vocabulary you want to delete using <code>VocabularyName</code>.</p>\"\
    },\
    \"DeleteTranscriptionJob\":{\
      \"name\":\"DeleteTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTranscriptionJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a transcription job, along with any related information. To use this operation, specify the name of the job you want to delete using <code>TranscriptionJobName</code>.</p>\"\
    },\
    \"DeleteVocabulary\":{\
      \"name\":\"DeleteVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a custom vocabulary. To use this operation, specify the name of the vocabulary you want to delete using <code>VocabularyName</code>.</p>\"\
    },\
    \"DeleteVocabularyFilter\":{\
      \"name\":\"DeleteVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a vocabulary filter. To use this operation, specify the name of the vocabulary filter you want to delete using <code>VocabularyFilterName</code>.</p>\"\
    },\
    \"DescribeLanguageModel\":{\
      \"name\":\"DescribeLanguageModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLanguageModelRequest\"},\
      \"output\":{\"shape\":\"DescribeLanguageModelResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Provides information about a specific custom language model in your Amazon Web Services account.</p> <p>This operation also shows if the base language model you used to create your custom language model has been updated. If Amazon Transcribe has updated the base model, you can create a new custom language model using the updated base model.</p> <p>If you tried to create a new custom language model and the request wasn't successful, you can use this operation to help identify the reason. </p>\"\
    },\
    \"GetCallAnalyticsCategory\":{\
      \"name\":\"GetCallAnalyticsCategory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCallAnalyticsCategoryRequest\"},\
      \"output\":{\"shape\":\"GetCallAnalyticsCategoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieves information about a call analytics category.</p>\"\
    },\
    \"GetCallAnalyticsJob\":{\
      \"name\":\"GetCallAnalyticsJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetCallAnalyticsJobRequest\"},\
      \"output\":{\"shape\":\"GetCallAnalyticsJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves information about a call analytics job.</p> <p>To view the job's status, refer to the <code>CallAnalyticsJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can then find your transcript at the URI specified in the <code>TranscriptFileUri</code> field. If you enabled personally identifiable information (PII) redaction, the redacted transcript appears in the <code>RedactedTranscriptFileUri</code> field.</p>\"\
    },\
    \"GetMedicalTranscriptionJob\":{\
      \"name\":\"GetMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetMedicalTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetMedicalTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves information about a medical transcription job.</p> <p>To view the job's status, refer to the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished. You can then find your transcript at the URI specified in the <code>TranscriptFileUri</code> field.</p>\"\
    },\
    \"GetMedicalVocabulary\":{\
      \"name\":\"GetMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Retrieves information about a medical vocabulary.</p>\"\
    },\
    \"GetTranscriptionJob\":{\
      \"name\":\"GetTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a transcription job. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>.</p>\"\
    },\
    \"GetVocabulary\":{\
      \"name\":\"GetVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a vocabulary. </p>\"\
    },\
    \"GetVocabularyFilter\":{\
      \"name\":\"GetVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a vocabulary filter.</p>\"\
    },\
    \"ListCallAnalyticsCategories\":{\
      \"name\":\"ListCallAnalyticsCategories\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCallAnalyticsCategoriesRequest\"},\
      \"output\":{\"shape\":\"ListCallAnalyticsCategoriesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides more information about the call analytics categories that you've created. You can use the information in this list to find a specific category. You can then use the operation to get more information about it.</p>\"\
    },\
    \"ListCallAnalyticsJobs\":{\
      \"name\":\"ListCallAnalyticsJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListCallAnalyticsJobsRequest\"},\
      \"output\":{\"shape\":\"ListCallAnalyticsJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>List call analytics jobs with a specified status or substring that matches their names.</p>\"\
    },\
    \"ListLanguageModels\":{\
      \"name\":\"ListLanguageModels\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListLanguageModelsRequest\"},\
      \"output\":{\"shape\":\"ListLanguageModelsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Provides more information about the custom language models you've created. You can use the information in this list to find a specific custom language model. You can then use the operation to get more information about it.</p>\"\
    },\
    \"ListMedicalTranscriptionJobs\":{\
      \"name\":\"ListMedicalTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMedicalTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListMedicalTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists medical transcription jobs with a specified status or substring that matches their names.</p>\"\
    },\
    \"ListMedicalVocabularies\":{\
      \"name\":\"ListMedicalVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListMedicalVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListMedicalVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of vocabularies that match the specified criteria. If you don't enter a value in any of the request parameters, returns the entire list of vocabularies.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all tags associated with a given transcription job, vocabulary, or resource.</p>\"\
    },\
    \"ListTranscriptionJobs\":{\
      \"name\":\"ListTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists transcription jobs with the specified status.</p>\"\
    },\
    \"ListVocabularies\":{\
      \"name\":\"ListVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of vocabularies that match the specified criteria. If no criteria are specified, returns the entire list of vocabularies.</p>\"\
    },\
    \"ListVocabularyFilters\":{\
      \"name\":\"ListVocabularyFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabularyFiltersRequest\"},\
      \"output\":{\"shape\":\"ListVocabularyFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about vocabulary filters.</p>\"\
    },\
    \"StartCallAnalyticsJob\":{\
      \"name\":\"StartCallAnalyticsJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartCallAnalyticsJobRequest\"},\
      \"output\":{\"shape\":\"StartCallAnalyticsJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous analytics job that not only transcribes the audio recording of a caller and agent, but also returns additional insights. These insights include how quickly or loudly the caller or agent was speaking. To retrieve additional insights with your analytics jobs, create categories. A category is a way to classify analytics jobs based on attributes, such as a customer's sentiment or a particular phrase being used during the call. For more information, see the operation. </p>\"\
    },\
    \"StartMedicalTranscriptionJob\":{\
      \"name\":\"StartMedicalTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartMedicalTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartMedicalTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts a batch job to transcribe medical speech to text.</p>\"\
    },\
    \"StartTranscriptionJob\":{\
      \"name\":\"StartTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous job to transcribe speech to text.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Tags an Amazon Transcribe resource with the given list of tags.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes specified tags from a specified Amazon Transcribe resource.</p>\"\
    },\
    \"UpdateCallAnalyticsCategory\":{\
      \"name\":\"UpdateCallAnalyticsCategory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateCallAnalyticsCategoryRequest\"},\
      \"output\":{\"shape\":\"UpdateCallAnalyticsCategoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates the call analytics category with new values. The <code>UpdateCallAnalyticsCategory</code> operation overwrites all of the existing information with the values that you provide in the request.</p>\"\
    },\
    \"UpdateMedicalVocabulary\":{\
      \"name\":\"UpdateMedicalVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateMedicalVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateMedicalVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates a vocabulary with new values that you provide in a different text file from the one you used to create the vocabulary. The <code>UpdateMedicalVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request.</p>\"\
    },\
    \"UpdateVocabulary\":{\
      \"name\":\"UpdateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing vocabulary with new values. The <code>UpdateVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request. </p>\"\
    },\
    \"UpdateVocabularyFilter\":{\
      \"name\":\"UpdateVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates a vocabulary filter with a new list of filtered words.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AbsoluteTimeRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartTime\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>A value that indicates the beginning of the time range in seconds. To set absolute time range, you must specify a start time and an end time. For example, if you specify the following values:</p> <ul> <li> <p>StartTime - 10000</p> </li> <li> <p>Endtime - 50000</p> </li> </ul> <p>The time range is set between 10,000 milliseconds and 50,000 milliseconds into the call.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>A value that indicates the end of the time range in milliseconds. To set absolute time range, you must specify a start time and an end time. For example, if you specify the following values:</p> <ul> <li> <p>StartTime - 10000</p> </li> <li> <p>Endtime - 50000</p> </li> </ul> <p>The time range is set between 10,000 milliseconds and 50,000 milliseconds into the call.</p>\"\
        },\
        \"First\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>A time range from the beginning of the call to the value that you've specified. For example, if you specify <code>100000</code>, the time range is set to the first 100,000 milliseconds of the call.</p>\"\
        },\
        \"Last\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>A time range from the value that you've specified to the end of the call. For example, if you specify <code>100000</code>, the time range is set to the last 100,000 milliseconds of the call.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A time range, set in seconds, between two points in the call.</p>\"\
    },\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>Your request didn't pass one or more validation tests. For example, if the entity that you're trying to delete doesn't exist or if it is in a non-terminal state (for example, it's \\\"in progress\\\"). See the exception <code>Message</code> field for more information.</p>\",\
      \"exception\":true\
    },\
    \"BaseModelName\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NarrowBand\",\
        \"WideBand\"\
      ]\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CLMLanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en-US\",\
        \"hi-IN\",\
        \"es-US\",\
        \"en-GB\",\
        \"en-AU\"\
      ]\
    },\
    \"CallAnalyticsJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the call analytics job.</p>\"\
        },\
        \"CallAnalyticsJobStatus\":{\
          \"shape\":\"CallAnalyticsJobStatus\",\
          \"documentation\":\"<p>The status of the analytics job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>If you know the language spoken between the customer and the agent, specify a language code for this field.</p> <p>If you don't know the language, you can leave this field blank, and Amazon Transcribe will use machine learning to automatically identify the language. To improve the accuracy of language identification, you can provide an array containing the possible language codes for the language spoken in your audio. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> for additional information.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the input audio.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input audio file. Note: for call analytics jobs, only the following media formats are supported: MP3, MP4, WAV, FLAC, OGG, and WebM.</p>\"\
        },\
        \"Media\":{\"shape\":\"Media\"},\
        \"Transcript\":{\"shape\":\"Transcript\"},\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the analytics job started processing.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the analytics job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the analytics job was completed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>AnalyticsJobStatus</code> is <code>FAILED</code>, this field contains information about why the job failed.</p> <p>The <code>FailureReason</code> field can contain one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code>: The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code>: The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure the two values match.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code>: The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8,000 and 48,000 Hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code>: The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid file size: file size too large</code>: The size of your audio file is larger than what Amazon Transcribe Medical can process. For more information, see <i>Guidelines and Quotas</i> in the Amazon Transcribe Medical Guide.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code>: Your audio contains more channels than Amazon Transcribe Medical is configured to process. To request additional channels, see Amazon Transcribe Medical Endpoints and Quotas in the <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/Welcome.html\\\">Amazon Web Services General Reference</a>.</p> </li> </ul>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) that you use to access the analytics job. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.</p>\"\
        },\
        \"IdentifiedLanguageScore\":{\
          \"shape\":\"IdentifiedLanguageScore\",\
          \"documentation\":\"<p>A value between zero and one that Amazon Transcribe assigned to the language that it identified in the source audio. This value appears only when you don't provide a single language code. Larger values indicate that Amazon Transcribe has higher confidence in the language that it identified.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"CallAnalyticsJobSettings\",\
          \"documentation\":\"<p>Provides information about the settings used to run a transcription job.</p>\"\
        },\
        \"ChannelDefinitions\":{\
          \"shape\":\"ChannelDefinitions\",\
          \"documentation\":\"<p>Shows numeric values to indicate the channel assigned to the agent's audio and the channel assigned to the customer's audio. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an asynchronous analytics job that was created with the <code>StartAnalyticsJob</code> operation.</p>\"\
    },\
    \"CallAnalyticsJobName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"CallAnalyticsJobSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of a vocabulary to use when processing the call analytics job.</p>\"\
        },\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to use when running a call analytics job. The filter that you specify must have the same language code as the analytics job.</p>\"\
        },\
        \"VocabularyFilterMethod\":{\
          \"shape\":\"VocabularyFilterMethod\",\
          \"documentation\":\"<p>Set to mask to remove filtered text from the transcript and replace it with three asterisks (\\\"***\\\") as placeholder text. Set to <code>remove</code> to remove filtered text from the transcript without using placeholder text. Set to <code>tag</code> to mark the word in the transcription output that matches the vocabulary filter. When you set the filter method to <code>tag</code>, the words matching your vocabulary filter are not masked or removed.</p>\"\
        },\
        \"LanguageModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The structure used to describe a custom language model.</p>\"\
        },\
        \"ContentRedaction\":{\"shape\":\"ContentRedaction\"},\
        \"LanguageOptions\":{\
          \"shape\":\"LanguageOptions\",\
          \"documentation\":\"<p>When you run a call analytics job, you can specify the language spoken in the audio, or you can have Amazon Transcribe identify the language for you.</p> <p>To specify a language, specify an array with one language code. If you don't know the language, you can leave this field blank and Amazon Transcribe will use machine learning to identify the language for you. To improve the ability of Amazon Transcribe to correctly identify the language, you can provide an array of the languages that can be present in the audio. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a> for additional information.</p>\"\
        },\
        \"LanguageIdSettings\":{\
          \"shape\":\"LanguageIdSettingsMap\",\
          \"documentation\":\"<p>The language identification settings associated with your call analytics job. These settings include <code>VocabularyName</code>, <code>VocabularyFilterName</code>, and <code>LanguageModelName</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides optional settings for the <code>CallAnalyticsJob</code> operation. </p>\"\
    },\
    \"CallAnalyticsJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUED\",\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"CallAnalyticsJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CallAnalyticsJobSummary\"}\
    },\
    \"CallAnalyticsJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the call analytics job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the call analytics job was created.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job began processing.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the transcript in the source audio file.</p>\"\
        },\
        \"CallAnalyticsJobStatus\":{\
          \"shape\":\"CallAnalyticsJobStatus\",\
          \"documentation\":\"<p>The status of the call analytics job.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>CallAnalyticsJobStatus</code> is <code>FAILED</code>, a description of the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about a call analytics job.</p>\"\
    },\
    \"CategoryName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"CategoryProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>The name of the call analytics category.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>The rules used to create a call analytics category.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the call analytics category was created.</p>\"\
        },\
        \"LastUpdateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the call analytics category was most recently updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that contains the rules and additional information about a call analytics category.</p>\"\
    },\
    \"CategoryPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CategoryProperties\"}\
    },\
    \"ChannelDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelId\":{\
          \"shape\":\"ChannelId\",\
          \"documentation\":\"<p>A value that indicates the audio channel.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>Indicates whether the person speaking on the audio channel is the agent or customer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>For a call analytics job, an object that indicates the audio channel that belongs to the agent and the audio channel that belongs to the customer.</p>\"\
    },\
    \"ChannelDefinitions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChannelDefinition\"},\
      \"max\":2,\
      \"min\":2\
    },\
    \"ChannelId\":{\
      \"type\":\"integer\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There is already a resource with that name.</p>\",\
      \"exception\":true\
    },\
    \"ContentRedaction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RedactionType\",\
        \"RedactionOutput\"\
      ],\
      \"members\":{\
        \"RedactionType\":{\
          \"shape\":\"RedactionType\",\
          \"documentation\":\"<p>Request parameter that defines the entities to be redacted. The only accepted value is <code>PII</code>.</p>\"\
        },\
        \"RedactionOutput\":{\
          \"shape\":\"RedactionOutput\",\
          \"documentation\":\"<p>The output transcript file stored in either the default S3 bucket or in a bucket you specify.</p> <p>When you choose <code>redacted</code> Amazon Transcribe outputs only the redacted transcript.</p> <p>When you choose <code>redacted_and_unredacted</code> Amazon Transcribe outputs both the redacted and unredacted transcripts.</p>\"\
        },\
        \"PiiEntityTypes\":{\
          \"shape\":\"PiiEntityTypes\",\
          \"documentation\":\"<p>The types of personally identifiable information (PII) you want to redact in your transcript.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Settings for content redaction within a transcription job.</p>\"\
    },\
    \"CreateCallAnalyticsCategoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CategoryName\",\
        \"Rules\"\
      ],\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>A unique name, chosen by you, for your call analytics category. For example, <code>sentiment-positive-last30seconds</code>.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>Rules make up a call analytics category. When creating a call analytics category, you must create between 1 and 20 rules for your category. For each rule, you specify a filter you want applied to the attributes of a call. For example, you can choose a sentiment filter that detects if a customer's sentiment was positive during the last 30 seconds of the call.</p>\"\
        }\
      }\
    },\
    \"CreateCallAnalyticsCategoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CategoryProperties\":{\
          \"shape\":\"CategoryProperties\",\
          \"documentation\":\"<p>If your audio matches one of your categories, this field contains data on that category and its associated rules. This parameter shows which category is flagged (<code>CategoryName</code>) along with metadata for the rules that match your audio. Metadata includes the rule filter (such as <code>InterruptionFilter</code>, <code>NonTalkTimeFilter</code>, <code>SentimentFilter</code>, and <code>TranscriptFilter</code>) and where in your audio (<code>StartTime</code> and <code>EndTime</code>) the rule has a match.</p>\"\
        }\
      }\
    },\
    \"CreateLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"LanguageCode\",\
        \"BaseModelName\",\
        \"ModelName\",\
        \"InputDataConfig\"\
      ],\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language of your custom language model; note that the language code you select must match the language of your training and tuning data.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model, used to create your custom language model. Amazon Transcribe offers two options for base models: Wideband and Narrowband.</p> <p>If the audio you want to transcribe has a sample rate of 16,000 Hz or greater, choose <code>WideBand</code>. To transcribe audio with a sample rate less than 16,000 Hz, choose <code>NarrowBand</code>.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of your new custom language model.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a language model with the same name as a previous language model, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Contains your data access role ARN (Amazon Resource Name) and the Amazon S3 locations of your training (<code>S3Uri</code>) and tuning (<code>TuningDataS3Uri</code>) data.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Optionally add tags, each in the form of a key:value pair, to your new language model. See also: .</p>\"\
        }\
      }\
    },\
    \"CreateLanguageModelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your custom language model.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model, you used when creating your custom language model.</p> <p>If your audio has a sample rate of 16,000 Hz or greater, this value should be <code>WideBand</code>. If your audio has a sample rate of less than 16,000 Hz, this value should be <code>NarrowBand</code>.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The unique name you chose for your custom language model.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Lists your data access role ARN (Amazon Resource Name) and the Amazon S3 locations your provided for your training (<code>S3Uri</code>) and tuning (<code>TuningDataS3Uri</code>) data.</p>\"\
        },\
        \"ModelStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The status of your custom language model. When the status shows as <code>COMPLETED</code>, your model is ready to use.</p>\"\
        }\
      }\
    },\
    \"CreateMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\",\
        \"VocabularyFileUri\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of your new vocabulary.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a vocabulary with the same name as a previous vocabulary, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of the entries in your custom vocabulary. Note that U.S. English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location (URI) of the text file that contains your custom vocabulary. The URI must be in the same Amazon Web Services Region as the resource that you're calling.</p> <p>Here's an example URI path:</p> <p> <code>https://s3.us-east-1.amazonaws.com/my-s3-bucket/my-vocab-file.txt</code> </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more tags, each in the form of a key:value pair, to a new medical vocabulary at the time you create the new vocabulary.</p> <p>To learn more about using tags with Amazon Transcribe, refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html\\\">Tagging resources</a>.</p>\"\
        }\
      }\
    },\
    \"CreateMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name you chose for your vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your medical vocabulary. Note that U.S. English (<code>en-US</code>) is the only language supported with Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your custom medical vocabulary. If the state is <code>READY</code>, you can use the vocabulary in a <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time you created your custom medical vocabulary.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, <code>FailureReason</code> contains information about why the job failed.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyFilterName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of your new vocabulary filter.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a vocabulary filter with the same name as a previous vocabulary filter, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter. All words in the filter must be in the same language. The vocabulary filter can only be used with transcription jobs in the specified language.</p>\"\
        },\
        \"Words\":{\
          \"shape\":\"Words\",\
          \"documentation\":\"<p>The words you want in your vocabulary filter. Only use characters specified in the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character sets</a> for the language you're transcribing.</p> <p>Note that if you include <code>Words</code> in your request, you cannot use <code>VocabularyFilterFileUri</code>; you must choose one or the other.</p>\"\
        },\
        \"VocabularyFilterFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a>.</p> <p>Your vocabulary filter file must be less than 50 KB in size.</p> <p>Note that if you include <code>VocabularyFilterFileUri</code> in your request, you cannot use <code>Words</code>; you must choose one or the other.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more tags, each in the form of a key:value pair, to a new vocabulary filter at the time you create this new vocabulary filter.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code associated with your vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time the vocabulary filter was modified.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of your new vocabulary.</p> <p>This name is case sensitive, cannot contain spaces, and must be unique within an Amazon Web Services account. If you try to create a vocabulary with the same name as a previous vocabulary, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code that represents the language of the entries in your custom vocabulary. Each vocabulary must contain terms in only one language. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a>.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>Use this flag to include a list of terms within your request.</p> <p>Note that if you include <code>Phrases</code> in your request, you cannot use <code>VocabularyFileUri</code>; you must choose one or the other.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the text file that contains your custom vocabulary. The URI must be located in the same region as the API endpoint you're calling.</p> <p>Here's an example URI path:</p> <p> <code>https://s3.us-east-1.amazonaws.com/my-s3-bucket/my-vocab-file.txt</code> </p> <p>Note that if you include <code>VocabularyFileUri</code> in your request, you cannot use the <code>Phrases</code> flag; you must choose one or the other.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Adds one or more tags, each in the form of a key:value pair, to a new custom vocabulary at the time you create this new vocabulary.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name you chose for your vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code you selected for your vocabulary.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of your vocabulary. If the state is <code>READY</code>, you can use the vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time you created your custom vocabulary.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, <code>FailureReason</code> contains information about why the job failed.</p>\"\
        }\
      }\
    },\
    \"DataAccessRoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"^arn:(aws|aws-cn|aws-us-gov|aws-iso-{0,1}[a-z]{0,1}):iam::[0-9]{0,63}:role/[A-Za-z0-9:_/+=,@.-]{0,1024}$\"\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"DeleteCallAnalyticsCategoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CategoryName\"],\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>The name of the call analytics category you want to delete. Category names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteCallAnalyticsCategoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteCallAnalyticsJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CallAnalyticsJobName\"],\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the call analytics job you want to delete. Job names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteCallAnalyticsJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelName\"],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the model you want to delete. Model names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MedicalTranscriptionJobName\"],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job you want to delete. Job names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary that you want to delete. Vocabulary names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job you want to delete. Job names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter you want to delete. Vocabulary filter names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary you want to delete. Vocabulary names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DescribeLanguageModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ModelName\"],\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model you want described. Model names are case-sensitive.</p>\"\
        }\
      }\
    },\
    \"DescribeLanguageModelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageModel\":{\
          \"shape\":\"LanguageModel\",\
          \"documentation\":\"<p>The name of the custom language model you requested more information about.</p>\"\
        }\
      }\
    },\
    \"FailureReason\":{\"type\":\"string\"},\
    \"GetCallAnalyticsCategoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CategoryName\"],\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>The name of the category you want information about. Category names are case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetCallAnalyticsCategoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CategoryProperties\":{\
          \"shape\":\"CategoryProperties\",\
          \"documentation\":\"<p>Provides you with the rules associated with the category you specified in your <code>GetCallAnalyticsCategory</code> request.</p>\"\
        }\
      }\
    },\
    \"GetCallAnalyticsJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CallAnalyticsJobName\"],\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the analytics job you want information about. This value is case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetCallAnalyticsJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CallAnalyticsJob\":{\
          \"shape\":\"CallAnalyticsJob\",\
          \"documentation\":\"<p>An object that contains detailed information about your call analytics job. Returned fields include: <code>CallAnalyticsJobName</code>, <code>CallAnalyticsJobStatus</code>, <code>ChannelDefinitions</code>, <code>CompletionTime</code>, <code>CreationTime</code>, <code>DataAccessRoleArn</code>, <code>FailureReason</code>, <code>IdentifiedLanguageScore</code>, <code>LanguageCode</code>, <code>Media</code>, <code>MediaFormat</code>, <code>MediaSampleRateHertz</code>, <code>Settings</code>, <code>StartTime</code>, and <code>Transcript</code>.</p>\"\
        }\
      }\
    },\
    \"GetMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MedicalTranscriptionJobName\"],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job you want information about. This value is case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetMedicalTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJob\":{\
          \"shape\":\"MedicalTranscriptionJob\",\
          \"documentation\":\"<p>An object that contains detailed information about your medical transcription job. Returned fields include: <code>CompletionTime</code>, <code>ContentIdentificationType</code>, <code>CreationTime</code>, <code>FailureReason</code>, <code>LanguageCode</code>, <code>Media</code>, <code>MediaFormat</code>, <code>MediaSampleRateHertz</code>, <code>MedicalTranscriptionJobName</code>, <code>Settings</code>, <code>Specialty</code>, <code>StartTime</code>, <code>Tags</code>, <code>Transcript</code>, <code>TranscriptionJobStatus</code>, and <code>Type</code>.</p>\"\
        }\
      }\
    },\
    \"GetMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the medical vocabulary you want information about. This value is case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary returned by Amazon Transcribe Medical.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The valid language code for your vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. If the <code>VocabularyState</code> is <code>READY</code> then you can use it in the <code>StartMedicalTranscriptionJob</code> operation.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified with a text file different from the one that was previously used.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If your request returns a <code>VocabularyState</code> that is <code>FAILED</code>, the <code>FailureReason</code> field contains information about why the request failed.</p> <p>For more information, refer to the <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html\\\">Common Errors</a> section.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the vocabulary is stored; use this URI to view or download the vocabulary.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object that contains the results of the transcription job.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter for which to return information.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the contents of the vocabulary filter were updated.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The URI of the list of words in the vocabulary filter. You can use this URI to get the list of words.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return information about. The name is case sensitive.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the vocabulary is stored. Use this URI to get the contents of the vocabulary. The URI is available for a limited time.</p>\"\
        }\
      }\
    },\
    \"IdentifiedLanguageScore\":{\"type\":\"float\"},\
    \"InputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3Uri\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 prefix you specify to access the plain text files that you use to train your custom language model.</p>\"\
        },\
        \"TuningDataS3Uri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 prefix you specify to access the plain text files that you use to tune your custom language model.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that uniquely identifies the permissions you've given Amazon Transcribe to access your Amazon S3 buckets containing your media files or text data. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The object that contains the Amazon S3 object location and access role required to train and tune your custom language model.</p>\"\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There was an internal error. Check the error message and try your request again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InterruptionFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Threshold\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>The duration of the interruption.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>Indicates whether the caller or customer was interrupting.</p>\"\
        },\
        \"AbsoluteTimeRange\":{\
          \"shape\":\"AbsoluteTimeRange\",\
          \"documentation\":\"<p>An object you can use to specify a time range (in milliseconds) for when you'd want to find the interruption. For example, you could search for an interruption between the 30,000 millisecond mark and the 45,000 millisecond mark. You could also specify the time period as the first 15,000 milliseconds or the last 15,000 milliseconds.</p>\"\
        },\
        \"RelativeTimeRange\":{\
          \"shape\":\"RelativeTimeRange\",\
          \"documentation\":\"<p>An object that allows percentages to specify the proportion of the call where there was a interruption. For example, you can specify the first half of the call. You can also specify the period of time between halfway through to three-quarters of the way through the call. Because the length of conversation can vary between calls, you can apply relative time ranges across all calls.</p>\"\
        },\
        \"Negate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to <code>TRUE</code> to look for a time period where there was no interruption.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that enables you to configure your category to be applied to call analytics jobs where either the customer or agent was interrupted.</p>\"\
    },\
    \"JobExecutionSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowDeferredExecution\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether a job should be queued by Amazon Transcribe when the concurrent execution limit is exceeded. When the <code>AllowDeferredExecution</code> field is true, jobs are queued and executed when the number of executing jobs falls below the concurrent execution limit. If the field is false, Amazon Transcribe returns a <code>LimitExceededException</code> exception.</p> <p>Note that job queuing is enabled by default for call analytics jobs.</p> <p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN), in the form <code>arn:partition:service:region:account-id:resource-type/resource-id</code>, of a role that has access to the S3 bucket that contains the input files. Amazon Transcribe assumes this role to read queued media files. If you have specified an output S3 bucket for the transcription results, this role should have access to the output bucket as well.</p> <p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about when a transcription job should be executed.</p>\"\
    },\
    \"KMSEncryptionContextMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"NonEmptyString\"},\
      \"value\":{\"shape\":\"NonEmptyString\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"KMSKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"^[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,2048}$\"\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"af-ZA\",\
        \"ar-AE\",\
        \"ar-SA\",\
        \"cy-GB\",\
        \"da-DK\",\
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
        \"fa-IR\",\
        \"fr-CA\",\
        \"fr-FR\",\
        \"ga-IE\",\
        \"gd-GB\",\
        \"he-IL\",\
        \"hi-IN\",\
        \"id-ID\",\
        \"it-IT\",\
        \"ja-JP\",\
        \"ko-KR\",\
        \"ms-MY\",\
        \"nl-NL\",\
        \"pt-BR\",\
        \"pt-PT\",\
        \"ru-RU\",\
        \"ta-IN\",\
        \"te-IN\",\
        \"tr-TR\",\
        \"zh-CN\",\
        \"zh-TW\",\
        \"th-TH\",\
        \"en-ZA\",\
        \"en-NZ\"\
      ]\
    },\
    \"LanguageIdSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary you want to use when processing your transcription job. The vocabulary you specify must have the same language codes as the transcription job; if the languages don't match, the vocabulary isn't applied.</p>\"\
        },\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter you want to use when transcribing your audio. The filter you specify must have the same language codes as the transcription job; if the languages don't match, the vocabulary filter isn't be applied.</p>\"\
        },\
        \"LanguageModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the language model you want to use when transcribing your audio. The model you specify must have the same language codes as the transcription job; if the languages don't match, the language model isn't be applied.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Language-specific settings that can be specified when language identification is enabled.</p>\"\
    },\
    \"LanguageIdSettingsMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"LanguageCode\"},\
      \"value\":{\"shape\":\"LanguageIdSettings\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"LanguageModel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of the custom language model.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The time the custom language model was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The most recent time the custom language model was modified.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"CLMLanguageCode\",\
          \"documentation\":\"<p>The language code you used to create your custom language model.</p>\"\
        },\
        \"BaseModelName\":{\
          \"shape\":\"BaseModelName\",\
          \"documentation\":\"<p>The Amazon Transcribe standard language model, or base model used to create the custom language model.</p>\"\
        },\
        \"ModelStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The creation status of a custom language model. When the status is <code>COMPLETED</code> the model is ready for use.</p>\"\
        },\
        \"UpgradeAvailability\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether the base model used for the custom language model is up to date. If this field is <code>false</code> then you are running the most up-to-date version of the base model in your custom language model.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>The reason why the custom language model couldn't be created.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The data access role and Amazon S3 prefixes for the input files used to train the custom language model.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The structure used to describe a custom language model.</p>\"\
    },\
    \"LanguageOptions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LanguageCode\"},\
      \"min\":1\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Either you have sent too many requests or your input file is too long. Wait before you resend your request, or use a smaller file and resend the request.</p>\",\
      \"exception\":true\
    },\
    \"ListCallAnalyticsCategoriesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>When included, <code>NextToken</code>fetches the next set of categories if the result of the previous request was truncated.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of categories to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListCallAnalyticsCategoriesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The operation returns a page of jobs at a time. The maximum size of the list is set by the <code>MaxResults</code> parameter. If there are more categories in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the operation to return the next page of analytics categories.</p>\"\
        },\
        \"Categories\":{\
          \"shape\":\"CategoryPropertiesList\",\
          \"documentation\":\"<p>A list of objects containing information about analytics categories.</p>\"\
        }\
      }\
    },\
    \"ListCallAnalyticsJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"CallAnalyticsJobStatus\",\
          \"documentation\":\"<p>When specified, returns only call analytics jobs with the specified status. Jobs are ordered by creation date, with the most recent jobs returned first. If you don't specify a status, Amazon Transcribe returns all analytics jobs ordered by creation date.</p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you receive a truncated result in the previous request of , include <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of call analytics jobs to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used. </p>\"\
        }\
      }\
    },\
    \"ListCallAnalyticsJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"CallAnalyticsJobStatus\",\
          \"documentation\":\"<p>When specified, returns only call analytics jobs with that status. Jobs are ordered by creation date, with the most recent jobs returned first. If you don't specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in your next request to the operation to return next page of jobs.</p>\"\
        },\
        \"CallAnalyticsJobSummaries\":{\
          \"shape\":\"CallAnalyticsJobSummaries\",\
          \"documentation\":\"<p>A list of objects containing summary information for a transcription job.</p>\"\
        }\
      }\
    },\
    \"ListLanguageModelsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusEquals\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>When specified, returns only custom language models with the specified status. Language models are ordered by creation date, with the newest models first. If you don't specify a status, Amazon Transcribe returns all custom language models ordered by date.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>When specified, the custom language model names returned contain the substring you've specified.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>When included, fetches the next set of jobs if the result of the previous request was truncated.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of language models to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListLanguageModelsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The operation returns a page of jobs at a time. The maximum size of the list is set by the MaxResults parameter. If there are more language models in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the operation to return the next page of language models.</p>\"\
        },\
        \"Models\":{\
          \"shape\":\"Models\",\
          \"documentation\":\"<p>A list of objects containing information about custom language models.</p>\"\
        }\
      }\
    },\
    \"ListMedicalTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>When specified, returns only medical transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you don't specify a status, Amazon Transcribe Medical returns all transcription jobs ordered by creation date.</p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If you a receive a truncated result in the previous request of <code>ListMedicalTranscriptionJobs</code>, include <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p> The maximum number of medical transcription jobs to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListMedicalTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested status of the medical transcription jobs returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListMedicalTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If the number of jobs exceeds what can fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListMedicalTranscriptionJobs</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"MedicalTranscriptionJobSummaries\":{\
          \"shape\":\"MedicalTranscriptionJobSummaries\",\
          \"documentation\":\"<p>A list of objects containing summary information for a transcription job.</p>\"\
        }\
      }\
    },\
    \"ListMedicalVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of your previous request to <code>ListMedicalVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of vocabularies.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of vocabularies to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>When specified, returns only vocabularies with the <code>VocabularyState</code> equal to the specified vocabulary state. Use this field to see which vocabularies are ready for your medical transcription jobs.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>Returns vocabularies whose names contain the specified string. The search is not case sensitive. <code>ListMedicalVocabularies</code> returns both \\\"<code>vocabularyname</code>\\\" and \\\"<code>VocabularyName</code>\\\".</p>\"\
        }\
      }\
    },\
    \"ListMedicalVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The requested vocabulary state.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListMedicalVocabularies</code> operation returns a page of vocabularies at a time. You set the maximum number of vocabularies to return on a page with the <code>MaxResults</code> parameter. If there are more jobs in the list will fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code> token. To return the next page of vocabularies, include the token in the next request to the <code>ListMedicalVocabularies</code> operation.</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>A list of objects that describe the vocabularies that match your search criteria.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TranscribeArn\",\
          \"documentation\":\"<p>Lists all tags associated with a given Amazon Resource Name (ARN). ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code> (for example, <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>). Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TranscribeArn\",\
          \"documentation\":\"<p>Lists all tags associated with the given Amazon Resource Name (ARN). </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Lists all tags associated with the given transcription job, vocabulary, or resource.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>When specified, returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you donât specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date.</p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListTranscriptionJobs</code> is truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of jobs to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested status of the jobs returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListTranscriptionJobs</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"TranscriptionJobSummaries\":{\
          \"shape\":\"TranscriptionJobSummaries\",\
          \"documentation\":\"<p>A list of objects containing summary information for a transcription job.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of vocabularies to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>When specified, only returns vocabularies with the <code>VocabularyState</code> field equal to the specified state.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>When specified, the vocabularies returned in the list are limited to vocabularies whose name contains the specified string. The search is not case sensitive, <code>ListVocabularies</code> returns both \\\"vocabularyname\\\" and \\\"VocabularyName\\\" in the response list.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The requested vocabulary state.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListVocabularies</code> operation returns a page of vocabularies at a time. The maximum size of the page is set in the <code>MaxResults</code> parameter. If there are more jobs in the list than will fit on the page, Amazon Transcribe returns the <code>NextPage</code> token. To return in the next page of jobs, include the token in the next request to the <code>ListVocabularies</code> operation.</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>A list of objects that describe the vocabularies that match the search criteria in the request.</p>\"\
        }\
      }\
    },\
    \"ListVocabularyFiltersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListVocabularyFilters</code> was truncated, include the <code>NextToken</code> to fetch the next set of collections.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of filters to return in each page of results. If there are fewer results than the value you specify, only the actual results are returned. If you do not specify a value, the default of 5 is used.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>Filters the response so that it only contains vocabulary filters whose name contains the specified string.</p>\"\
        }\
      }\
    },\
    \"ListVocabularyFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListVocabularyFilters</code> operation returns a page of collections at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListVocabularyFilters</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"VocabularyFilters\":{\
          \"shape\":\"VocabularyFilters\",\
          \"documentation\":\"<p>The list of vocabulary filters. It contains at most <code>MaxResults</code> number of filters. If there are more filters, call the <code>ListVocabularyFilters</code> operation again with the <code>NextToken</code> parameter in the request set to the value of the <code>NextToken</code> field in the response.</p>\"\
        }\
      }\
    },\
    \"MaxAlternatives\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxSpeakers\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"Media\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MediaFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p> <p> <code>s3://DOC-EXAMPLE-BUCKET/keyprefix/objectkey</code> </p> <p>For example:</p> <p> <code>s3://DOC-EXAMPLE-BUCKET/example.flac</code> </p> <p> <code>s3://DOC-EXAMPLE-BUCKET/mediafiles/example.flac</code> </p> <p>For more information about S3 object names, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>\"\
        },\
        \"RedactedMediaFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location for your redacted output media file. This is only supported for call analytics jobs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the input media file in a transcription request.</p>\"\
    },\
    \"MediaFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"mp3\",\
        \"mp4\",\
        \"wav\",\
        \"flac\",\
        \"ogg\",\
        \"amr\",\
        \"webm\"\
      ]\
    },\
    \"MediaSampleRateHertz\":{\
      \"type\":\"integer\",\
      \"max\":48000,\
      \"min\":8000\
    },\
    \"MedicalContentIdentificationType\":{\
      \"type\":\"string\",\
      \"enum\":[\"PHI\"]\
    },\
    \"MedicalMediaSampleRateHertz\":{\
      \"type\":\"integer\",\
      \"max\":48000,\
      \"min\":16000\
    },\
    \"MedicalTranscript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the medical transcript.</p> <p>Use this URI to access the medical transcript. This URI points to the S3 bucket you created to store the medical transcript.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the location of a medical transcript.</p>\"\
    },\
    \"MedicalTranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name for a given medical transcription job.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The completion status of a medical transcription job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language spoken in the source audio file. US English (en-US) is the only supported language for medical transcriptions. Any other value you enter for language code results in a <code>BadRequestException</code> error.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MedicalMediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the source audio containing medical information.</p> <p>If you don't specify the sample rate, Amazon Transcribe Medical determines it for you. If you choose to specify the sample rate, it must match the rate detected by Amazon Transcribe Medical.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\"shape\":\"Media\"},\
        \"Transcript\":{\
          \"shape\":\"MedicalTranscript\",\
          \"documentation\":\"<p>An object that contains the <code>MedicalTranscript</code>. The <code>MedicalTranscript</code> contains the <code>TranscriptFileUri</code>.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job started processing.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p> <p>The <code>FailureReason</code> field contains one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code>- The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code>- The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure the two values match.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code>- The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8,000 and 48,000 Hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code>- The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid file size: file size too large</code>- The size of your audio file is larger than what Amazon Transcribe Medical can process. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Guidelines and Quotas</a> in the <i>Amazon Transcribe Medical Guide</i>.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code>- Your audio contains more channels than Amazon Transcribe Medical is configured to process. To request additional channels, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/transcribe-medical.html\\\">Amazon Transcribe Medical Endpoints and Quotas</a> in the <i>Amazon Web Services General Reference</i>.</p> </li> </ul>\"\
        },\
        \"Settings\":{\
          \"shape\":\"MedicalTranscriptionSetting\",\
          \"documentation\":\"<p>Object that contains object.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>Shows the type of content that you've configured Amazon Transcribe Medical to identify in a transcription job. If the value is <code>PHI</code>, you've configured the job to identify personal health information (PHI) in the transcription output.</p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>The medical specialty of any clinicians providing a dictation or having a conversation. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-medical-conversation.html\\\">Transcribing a medical conversation</a>for a list of supported specialties.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>The type of speech in the transcription job. <code>CONVERSATION</code> is generally used for patient-physician dialogues. <code>DICTATION</code> is the setting for physicians speaking their notes after seeing a patient. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/what-is-transcribe-med.html\\\">What is Amazon Transcribe Medical?</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A key:value pair assigned to a given medical transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The data structure that contains the information for a medical transcription job.</p>\"\
    },\
    \"MedicalTranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MedicalTranscriptionJobSummary\"}\
    },\
    \"MedicalTranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of a medical transcription job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the medical transcription job was created.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job began processing.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the transcript in the source audio file.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the medical transcription job.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a description of the error.</p>\"\
        },\
        \"OutputLocationType\":{\
          \"shape\":\"OutputLocationType\",\
          \"documentation\":\"<p>Indicates the location of the transcription job's output. This field must be the path of an S3 bucket; if you don't already have an S3 bucket, one is created based on the path you add.</p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>The medical specialty of the transcription job. Refer to <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-medical-conversation.html\\\">Transcribing a medical conversation</a>for a list of supported specialties.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>Shows the type of information you've configured Amazon Transcribe Medical to identify in a transcription job. If the value is <code>PHI</code>, you've configured the transcription job to identify personal health information (PHI).</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>The speech of the clinician in the input audio.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides summary information about a transcription job.</p>\"\
    },\
    \"MedicalTranscriptionSetting\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels in the <code>MaxSpeakerLabels</code> field.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers are identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        },\
        \"ChannelIdentification\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Instructs Amazon Transcribe Medical to process each audio channel separately and then merge the transcription output of each channel into a single transcription.</p> <p>Amazon Transcribe Medical also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of item. The alternative transcriptions also come with confidence scores provided by Amazon Transcribe Medical.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"ShowAlternatives\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether alternative transcripts are generated along with the transcript that has the highest confidence. If you set <code>ShowAlternatives</code> field to true, you must also set the maximum number of alternatives to return in the <code>MaxAlternatives</code> field.</p>\"\
        },\
        \"MaxAlternatives\":{\
          \"shape\":\"MaxAlternatives\",\
          \"documentation\":\"<p>The maximum number of alternatives that you tell the service to return. If you specify the <code>MaxAlternatives</code> field, you must set the <code>ShowAlternatives</code> field to true.</p>\"\
        },\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to use when processing a medical transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Optional settings for the <a>StartMedicalTranscriptionJob</a> operation.</p>\"\
    },\
    \"ModelName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"ModelSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageModelName\":{\
          \"shape\":\"ModelName\",\
          \"documentation\":\"<p>The name of your custom language model.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The object used to call your custom language model to your transcription job.</p>\"\
    },\
    \"ModelStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"Models\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LanguageModel\"}\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"pattern\":\".+\"\
    },\
    \"NonEmptyString\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\"\
    },\
    \"NonTalkTimeFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Threshold\":{\
          \"shape\":\"TimestampMilliseconds\",\
          \"documentation\":\"<p>The duration of the period when neither the customer nor agent was talking.</p>\"\
        },\
        \"AbsoluteTimeRange\":{\
          \"shape\":\"AbsoluteTimeRange\",\
          \"documentation\":\"<p>An object you can use to specify a time range (in milliseconds) for when no one is talking. For example, you could specify a time period between the 30,000 millisecond mark and the 45,000 millisecond mark. You could also specify the time period as the first 15,000 milliseconds or the last 15,000 milliseconds.</p>\"\
        },\
        \"RelativeTimeRange\":{\
          \"shape\":\"RelativeTimeRange\",\
          \"documentation\":\"<p>An object that allows percentages to specify the proportion of the call where there was silence. For example, you can specify the first half of the call. You can also specify the period of time between halfway through to three-quarters of the way through the call. Because the length of conversation can vary between calls, you can apply relative time ranges across all calls.</p>\"\
        },\
        \"Negate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to <code>TRUE</code> to look for a time period when people were talking.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that enables you to configure your category to be applied to call analytics jobs where either the customer or agent was interrupted.</p>\"\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>We can't find the requested resource. Check the name and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"OutputBucketName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"[a-z0-9][\\\\.\\\\-a-z0-9]{1,61}[a-z0-9]\"\
    },\
    \"OutputKey\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"[a-zA-Z0-9-_.!*'()/]{1,1024}$\"\
    },\
    \"OutputLocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CUSTOMER_BUCKET\",\
        \"SERVICE_BUCKET\"\
      ]\
    },\
    \"ParticipantRole\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AGENT\",\
        \"CUSTOMER\"\
      ]\
    },\
    \"Percentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Phrase\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\".+\"\
    },\
    \"Phrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Phrase\"}\
    },\
    \"PiiEntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BANK_ACCOUNT_NUMBER\",\
        \"BANK_ROUTING\",\
        \"CREDIT_DEBIT_NUMBER\",\
        \"CREDIT_DEBIT_CVV\",\
        \"CREDIT_DEBIT_EXPIRY\",\
        \"PIN\",\
        \"EMAIL\",\
        \"ADDRESS\",\
        \"NAME\",\
        \"PHONE\",\
        \"SSN\",\
        \"ALL\"\
      ]\
    },\
    \"PiiEntityTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PiiEntityType\"},\
      \"max\":11,\
      \"min\":0\
    },\
    \"RedactionOutput\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"redacted\",\
        \"redacted_and_unredacted\"\
      ]\
    },\
    \"RedactionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"PII\"]\
    },\
    \"RelativeTimeRange\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StartPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>A value that indicates the percentage of the beginning of the time range. To set a relative time range, you must specify a start percentage and an end percentage. For example, if you specify the following values:</p> <ul> <li> <p>StartPercentage - 10</p> </li> <li> <p>EndPercentage - 50</p> </li> </ul> <p>This looks at the time range starting from 10% of the way into the call to 50% of the way through the call. For a call that lasts 100,000 milliseconds, this example range would apply from the 10,000 millisecond mark to the 50,000 millisecond mark.</p>\"\
        },\
        \"EndPercentage\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>A value that indicates the percentage of the end of the time range. To set a relative time range, you must specify a start percentage and an end percentage. For example, if you specify the following values:</p> <ul> <li> <p>StartPercentage - 10</p> </li> <li> <p>EndPercentage - 50</p> </li> </ul> <p>This looks at the time range starting from 10% of the way into the call to 50% of the way through the call. For a call that lasts 100,000 milliseconds, this example range would apply from the 10,000 millisecond mark to the 50,000 millisecond mark.</p>\"\
        },\
        \"First\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>A range that takes the portion of the call up to the time in milliseconds set by the value that you've specified. For example, if you specify <code>120000</code>, the time range is set for the first 120,000 milliseconds of the call.</p>\"\
        },\
        \"Last\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>A range that takes the portion of the call from the time in milliseconds set by the value that you've specified to the end of the call. For example, if you specify <code>120000</code>, the time range is set for the last 120,000 milliseconds of the call.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that allows percentages to specify the proportion of the call where you would like to apply a filter. For example, you can specify the first half of the call. You can also specify the period of time between halfway through to three-quarters of the way through the call. Because the length of conversation can vary between calls, you can apply relative time ranges across all calls. </p>\"\
    },\
    \"Rule\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NonTalkTimeFilter\":{\
          \"shape\":\"NonTalkTimeFilter\",\
          \"documentation\":\"<p>A condition for a time period when neither the customer nor the agent was talking.</p>\"\
        },\
        \"InterruptionFilter\":{\
          \"shape\":\"InterruptionFilter\",\
          \"documentation\":\"<p>A condition for a time period when either the customer or agent was interrupting the other person. </p>\"\
        },\
        \"TranscriptFilter\":{\
          \"shape\":\"TranscriptFilter\",\
          \"documentation\":\"<p>A condition that catches particular words or phrases based on a exact match. For example, if you set the phrase \\\"I want to speak to the manager\\\", only that exact phrase will be returned.</p>\"\
        },\
        \"SentimentFilter\":{\
          \"shape\":\"SentimentFilter\",\
          \"documentation\":\"<p>A condition that is applied to a particular customer sentiment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A condition in the call between the customer and the agent that you want to filter for.</p>\",\
      \"union\":true\
    },\
    \"RuleList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Rule\"},\
      \"max\":20,\
      \"min\":1\
    },\
    \"SentimentFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\"Sentiments\"],\
      \"members\":{\
        \"Sentiments\":{\
          \"shape\":\"SentimentValueList\",\
          \"documentation\":\"<p>An array that enables you to specify sentiments for the customer or agent. You can specify one or more values.</p>\"\
        },\
        \"AbsoluteTimeRange\":{\
          \"shape\":\"AbsoluteTimeRange\",\
          \"documentation\":\"<p>The time range, measured in seconds, of the sentiment.</p>\"\
        },\
        \"RelativeTimeRange\":{\
          \"shape\":\"RelativeTimeRange\",\
          \"documentation\":\"<p>The time range, set in percentages, that correspond to proportion of the call.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>A value that determines whether the sentiment belongs to the customer or the agent.</p>\"\
        },\
        \"Negate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to <code>TRUE</code> to look for sentiments that weren't specified in the request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An object that enables you to specify a particular customer or agent sentiment. If at least 50 percent of the conversation turns (the back-and-forth between two speakers) in a specified time period match the specified sentiment, Amazon Transcribe will consider the sentiment a match.</p>\"\
    },\
    \"SentimentValue\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"POSITIVE\",\
        \"NEGATIVE\",\
        \"NEUTRAL\",\
        \"MIXED\"\
      ]\
    },\
    \"SentimentValueList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SentimentValue\"},\
      \"min\":1\
    },\
    \"Settings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of a vocabulary to use when processing the transcription job.</p>\"\
        },\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels <code>MaxSpeakerLabels</code> field.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers are identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        },\
        \"ChannelIdentification\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Instructs Amazon Transcribe to process each audio channel separately and then merge the transcription output of each channel into a single transcription.</p> <p>Amazon Transcribe also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of the item including the confidence that Amazon Transcribe has in the transcription.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"ShowAlternatives\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription contains alternative transcriptions. If you set the <code>ShowAlternatives</code> field to true, you must also set the maximum number of alternatives to return in the <code>MaxAlternatives</code> field.</p>\"\
        },\
        \"MaxAlternatives\":{\
          \"shape\":\"MaxAlternatives\",\
          \"documentation\":\"<p>The number of alternative transcriptions that the service should return. If you specify the <code>MaxAlternatives</code> field, you must set the <code>ShowAlternatives</code> field to true.</p>\"\
        },\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to use when transcribing the audio. The filter that you specify must have the same language code as the transcription job.</p>\"\
        },\
        \"VocabularyFilterMethod\":{\
          \"shape\":\"VocabularyFilterMethod\",\
          \"documentation\":\"<p>Set to <code>mask</code> to remove filtered text from the transcript and replace it with three asterisks (\\\"***\\\") as placeholder text. Set to <code>remove</code> to remove filtered text from the transcript without using placeholder text. Set to <code>tag</code> to mark the word in the transcription output that matches the vocabulary filter. When you set the filter method to <code>tag</code>, the words matching your vocabulary filter are not masked or removed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides optional settings for the <code>StartTranscriptionJob</code> operation.</p>\"\
    },\
    \"Specialty\":{\
      \"type\":\"string\",\
      \"enum\":[\"PRIMARYCARE\"]\
    },\
    \"StartCallAnalyticsJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CallAnalyticsJobName\",\
        \"Media\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"CallAnalyticsJobName\":{\
          \"shape\":\"CallAnalyticsJobName\",\
          \"documentation\":\"<p>The name of the call analytics job. You can't use the string \\\".\\\" or \\\"..\\\" by themselves as the job name. The name must also be unique within an Amazon Web Services account. If you try to create a call analytics job with the same name as a previous call analytics job, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"Media\":{\"shape\":\"Media\"},\
        \"OutputLocation\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location where the output of the call analytics job is stored. You can provide the following location types to store the output of call analytics job:</p> <ul> <li> <p>s3://DOC-EXAMPLE-BUCKET1</p> <p> If you specify a bucket, Amazon Transcribe saves the output of the analytics job as a JSON file at the root level of the bucket.</p> </li> <li> <p>s3://DOC-EXAMPLE-BUCKET1/folder/</p> <p>f you specify a path, Amazon Transcribe saves the output of the analytics job as s3://DOC-EXAMPLE-BUCKET1/folder/your-transcription-job-name.json.</p> <p>If you specify a folder, you must provide a trailing slash.</p> </li> <li> <p>s3://DOC-EXAMPLE-BUCKET1/folder/filename.json.</p> <p> If you provide a path that has the filename specified, Amazon Transcribe saves the output of the analytics job as s3://DOC-EXAMPLEBUCKET1/folder/filename.json.</p> </li> </ul> <p>You can specify an Amazon Web Services Key Management Service (KMS) key to encrypt the output of our analytics job using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of the analytics job output that is placed in your S3 bucket.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services Key Management Service key used to encrypt the output of the call analytics job. The user calling the operation must have permission to use the specified KMS key.</p> <p>You use either of the following to identify an Amazon Web Services KMS key in the current account:</p> <ul> <li> <p>KMS Key ID: \\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>KMS Key Alias: \\\"alias/ExampleAlias\\\"</p> </li> </ul> <p> You can use either of the following to identify a KMS key in the current account or another account:</p> <ul> <li> <p>Amazon Resource Name (ARN) of a KMS key in the current account or another account: \\\"arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef1234567890ab\\\"</p> </li> <li> <p>ARN of a KMS Key Alias: \\\"arn:aws:kms:region:accountID:alias/ExampleAlias\\\"</p> </li> </ul> <p>If you don't specify an encryption key, the output of the call analytics job is encrypted with the default Amazon S3 key (SSE-S3).</p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputLocation</code> parameter. </p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a role that has access to the S3 bucket that contains your input files. Amazon Transcribe assumes this role to read queued audio files. If you have specified an output S3 bucket for your transcription results, this role should have access to the output bucket as well.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"CallAnalyticsJobSettings\",\
          \"documentation\":\"<p>A <code>Settings</code> object that provides optional settings for a call analytics job.</p>\"\
        },\
        \"ChannelDefinitions\":{\
          \"shape\":\"ChannelDefinitions\",\
          \"documentation\":\"<p>When you start a call analytics job, you must pass an array that maps the agent and the customer to specific audio channels. The values you can assign to a channel are 0 and 1. The agent and the customer must each have their own channel. You can't assign more than one channel to an agent or customer. </p>\"\
        }\
      }\
    },\
    \"StartCallAnalyticsJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CallAnalyticsJob\":{\
          \"shape\":\"CallAnalyticsJob\",\
          \"documentation\":\"<p>An object containing the details of the asynchronous call analytics job.</p>\"\
        }\
      }\
    },\
    \"StartMedicalTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MedicalTranscriptionJobName\",\
        \"LanguageCode\",\
        \"Media\",\
        \"OutputBucketName\",\
        \"Specialty\",\
        \"Type\"\
      ],\
      \"members\":{\
        \"MedicalTranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the medical transcription job. You can't use the strings \\\"<code>.</code>\\\" or \\\"<code>..</code>\\\" by themselves as the job name. The name must also be unique within an Amazon Web Services account. If you try to create a medical transcription job with the same name as a previous medical transcription job, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language spoken in the input media file. US English (en-US) is the valid value for medical transcription jobs. Any other value you enter for language code results in a <code>BadRequestException</code> error.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MedicalMediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file.</p> <p>If you do not specify the media sample rate, Amazon Transcribe Medical determines the sample rate. If you specify the sample rate, it must match the rate detected by Amazon Transcribe Medical. In most cases, you should leave the <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe Medical determine the sample rate.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The audio format of the input media file.</p>\"\
        },\
        \"Media\":{\"shape\":\"Media\"},\
        \"OutputBucketName\":{\
          \"shape\":\"OutputBucketName\",\
          \"documentation\":\"<p>The Amazon S3 location where the transcription is stored.</p> <p>You must set <code>OutputBucketName</code> for Amazon Transcribe Medical to store the transcription results. Your transcript appears in the S3 location you specify. When you call the <a>GetMedicalTranscriptionJob</a>, the operation returns this location in the <code>TranscriptFileUri</code> field. The S3 bucket must have permissions that allow Amazon Transcribe Medical to put files in the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user\\\">Permissions Required for IAM User Roles</a>.</p> <p>You can specify an Amazon Web Services Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe Medical uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p>\"\
        },\
        \"OutputKey\":{\
          \"shape\":\"OutputKey\",\
          \"documentation\":\"<p>You can specify a location in an Amazon S3 bucket to store the output of your medical transcription job.</p> <p>If you don't specify an output key, Amazon Transcribe Medical stores the output of your transcription job in the Amazon S3 bucket you specified. By default, the object key is \\\"your-transcription-job-name.json\\\".</p> <p>You can use output keys to specify the Amazon S3 prefix and file name of the transcription output. For example, specifying the Amazon S3 prefix, \\\"folder1/folder2/\\\", as an output key would lead to the output being stored as \\\"folder1/folder2/your-transcription-job-name.json\\\". If you specify \\\"my-other-job-name.json\\\" as the output key, the object key is changed to \\\"my-other-job-name.json\\\". You can use an output key to change both the prefix and the file name, for example \\\"folder/my-other-job-name.json\\\".</p> <p>If you specify an output key, you must also specify an S3 bucket in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <a>StartMedicalTranscriptionJob</a> operation must have permission to use the specified KMS key.</p> <p>You use either of the following to identify a KMS key in the current account:</p> <ul> <li> <p>KMS Key ID: \\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>KMS Key Alias: \\\"alias/ExampleAlias\\\"</p> </li> </ul> <p>You can use either of the following to identify a KMS key in the current account or another account:</p> <ul> <li> <p>Amazon Resource Name (ARN) of a KMS key in the current account or another account: \\\"arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>ARN of a KMS Key Alias: \\\"arn:aws:kms:region:account ID:alias/ExampleAlias\\\"</p> </li> </ul> <p>If you don't specify an encryption key, the output of the medical transcription job is encrypted with the default Amazon S3 key (SSE-S3).</p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"KMSEncryptionContext\":{\
          \"shape\":\"KMSEncryptionContextMap\",\
          \"documentation\":\"<p>A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"MedicalTranscriptionSetting\",\
          \"documentation\":\"<p>Optional settings for the medical transcription job.</p>\"\
        },\
        \"ContentIdentificationType\":{\
          \"shape\":\"MedicalContentIdentificationType\",\
          \"documentation\":\"<p>You can configure Amazon Transcribe Medical to label content in the transcription output. If you specify <code>PHI</code>, Amazon Transcribe Medical labels the personal health information (PHI) that it identifies in the transcription output.</p>\"\
        },\
        \"Specialty\":{\
          \"shape\":\"Specialty\",\
          \"documentation\":\"<p>The medical specialty of any clinician speaking in the input media.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"Type\",\
          \"documentation\":\"<p>The type of speech in the input audio. <code>CONVERSATION</code> refers to conversations between two or more speakers, e.g., a conversations between doctors and patients. <code>DICTATION</code> refers to single-speaker dictated speech, such as clinical notes.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Add tags to an Amazon Transcribe Medical transcription job.</p>\"\
        }\
      }\
    },\
    \"StartMedicalTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MedicalTranscriptionJob\":{\
          \"shape\":\"MedicalTranscriptionJob\",\
          \"documentation\":\"<p>A batch job submitted to transcribe medical speech to text.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranscriptionJobName\",\
        \"Media\"\
      ],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job. You can't use the strings \\\"<code>.</code>\\\" or \\\"<code>..</code>\\\" by themselves as the job name. The name must also be unique within an Amazon Web Services account. If you try to create a transcription job with the same name as a previous transcription job, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language used in the input media file. You must include either <code>LanguageCode</code> or <code>IdentifyLanguage</code> in your request.</p> <p>To transcribe speech in Modern Standard Arabic (ar-SA), your audio or video file must be encoded at a sample rate of 16,000 Hz or higher.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p> <p>If you do not specify the media sample rate, Amazon Transcribe determines the sample rate. If you specify the sample rate, it must match the sample rate detected by Amazon Transcribe. In most cases, you should leave the <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe determine the sample rate.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for a transcription job.</p>\"\
        },\
        \"OutputBucketName\":{\
          \"shape\":\"OutputBucketName\",\
          \"documentation\":\"<p>The location where the transcription is stored.</p> <p>If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the transcript in the specified S3 bucket. When you call the <a>GetTranscriptionJob</a> operation, the operation returns this location in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>. If you enable content redaction and choose to output an unredacted transcript, that transcript's location still appears in the <code>TranscriptFileUri</code>. The S3 bucket must have permissions that allow Amazon Transcribe to put files in the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user\\\">Permissions Required for IAM User Roles</a>.</p> <p>You can specify an Amazon Web Services Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p> <p>If you don't set the <code>OutputBucketName</code>, Amazon Transcribe generates a pre-signed URL, a shareable URL that provides secure access to your transcription, and returns it in the <code>TranscriptFileUri</code> field. Use this URL to download the transcription.</p>\"\
        },\
        \"OutputKey\":{\
          \"shape\":\"OutputKey\",\
          \"documentation\":\"<p>You can specify a location in an Amazon S3 bucket to store the output of your transcription job.</p> <p>If you don't specify an output key, Amazon Transcribe stores the output of your transcription job in the Amazon S3 bucket you specified. By default, the object key is \\\"your-transcription-job-name.json\\\".</p> <p>You can use output keys to specify the Amazon S3 prefix and file name of the transcription output. For example, specifying the Amazon S3 prefix, \\\"folder1/folder2/\\\", as an output key would lead to the output being stored as \\\"folder1/folder2/your-transcription-job-name.json\\\". If you specify \\\"my-other-job-name.json\\\" as the output key, the object key is changed to \\\"my-other-job-name.json\\\". You can use an output key to change both the prefix and the file name, for example \\\"folder/my-other-job-name.json\\\".</p> <p>If you specify an output key, you must also specify an S3 bucket in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Web Services Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <code>StartTranscriptionJob</code> operation must have permission to use the specified KMS key.</p> <p>You can use either of the following to identify a KMS key in the current account:</p> <ul> <li> <p>KMS Key ID: \\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>KMS Key Alias: \\\"alias/ExampleAlias\\\"</p> </li> </ul> <p>You can use either of the following to identify a KMS key in the current account or another account:</p> <ul> <li> <p>Amazon Resource Name (ARN) of a KMS Key: \\\"arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>ARN of a KMS Key Alias: \\\"arn:aws:kms:region:account-ID:alias/ExampleAlias\\\"</p> </li> </ul> <p>If you don't specify an encryption key, the output of the transcription job is encrypted with the default Amazon S3 key (SSE-S3).</p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"KMSEncryptionContext\":{\
          \"shape\":\"KMSEncryptionContextMap\",\
          \"documentation\":\"<p>A map of plain text, non-secret key:value pairs, known as encryption context pairs, that provide an added layer of security for your data.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>A <code>Settings</code> object that provides optional settings for a transcription job.</p>\"\
        },\
        \"ModelSettings\":{\
          \"shape\":\"ModelSettings\",\
          \"documentation\":\"<p>Choose the custom language model you use for your transcription job in this parameter.</p>\"\
        },\
        \"JobExecutionSettings\":{\
          \"shape\":\"JobExecutionSettings\",\
          \"documentation\":\"<p>Provides information about how a transcription job is executed. Use this field to indicate that the job can be queued for deferred execution if the concurrency limit is reached and there are no slots available to immediately run the job.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>An object that contains the request parameters for content redaction.</p>\"\
        },\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set this field to <code>true</code> to enable automatic language identification. Automatic language identification is disabled by default. You receive a <code>BadRequestException</code> error if you enter a value for a <code>LanguageCode</code>.</p> <p>You must include either <code>LanguageCode</code> or <code>IdentifyLanguage</code> in your request.</p>\"\
        },\
        \"LanguageOptions\":{\
          \"shape\":\"LanguageOptions\",\
          \"documentation\":\"<p>An object containing a list of languages that might be present in your collection of audio files. Automatic language identification chooses a language that best matches the source audio from that list.</p> <p>To transcribe speech in Modern Standard Arabic (ar-SA), your audio or video file must be encoded at a sample rate of 16,000 Hz or higher.</p>\"\
        },\
        \"Subtitles\":{\
          \"shape\":\"Subtitles\",\
          \"documentation\":\"<p>Add subtitles to your batch transcription job.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Add tags to an Amazon Transcribe transcription job.</p>\"\
        },\
        \"LanguageIdSettings\":{\
          \"shape\":\"LanguageIdSettingsMap\",\
          \"documentation\":\"<p>The language identification settings associated with your transcription job. These settings include <code>VocabularyName</code>, <code>VocabularyFilterName</code>, and <code>LanguageModelName</code>.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>Provides information about your asynchronous transcription job.</p>\"\
        }\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"StringTargetList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"NonEmptyString\"},\
      \"min\":1\
    },\
    \"SubtitleFileUris\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Uri\"}\
    },\
    \"SubtitleFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"vtt\",\
        \"srt\"\
      ]\
    },\
    \"SubtitleFormats\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubtitleFormat\"}\
    },\
    \"SubtitleOutputStartIndex\":{\
      \"type\":\"integer\",\
      \"max\":1,\
      \"min\":0\
    },\
    \"Subtitles\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Formats\":{\
          \"shape\":\"SubtitleFormats\",\
          \"documentation\":\"<p>Specify the output format for your subtitle file; if you select both <code>srt</code> and <code>vtt</code> formats, two output files are generated.</p>\"\
        },\
        \"OutputStartIndex\":{\
          \"shape\":\"SubtitleOutputStartIndex\",\
          \"documentation\":\"<p>Defines the starting value that is assigned to the first subtitle segment.</p> <p>The default start index for Amazon Transcribe is <code>0</code>, which differs from the more widely used standard of <code>1</code>. If you're uncertain which value to use, we recommend choosing <code>1</code>, as this may improve compatibility with other services.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Generate subtitles for your batch transcription job. Note that your subtitle files are placed in the same location as your transcription output.</p>\"\
    },\
    \"SubtitlesOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Formats\":{\
          \"shape\":\"SubtitleFormats\",\
          \"documentation\":\"<p>The format of your subtitle files. If your request specified both <code>srt</code> and <code>vtt</code> formats, both formats are shown.</p>\"\
        },\
        \"SubtitleFileUris\":{\
          \"shape\":\"SubtitleFileUris\",\
          \"documentation\":\"<p>Contains the output location for your subtitle file. This location must be an S3 bucket.</p>\"\
        },\
        \"OutputStartIndex\":{\
          \"shape\":\"SubtitleOutputStartIndex\",\
          \"documentation\":\"<p>Shows the output start index value for your subtitle files. If you did not specify a value in your request, the default value of <code>0</code> is used.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The S3 location where your subtitle files are located. Note that your subtitle files are placed in the same location as your transcription output. Refer to <code>TranscriptFileUri</code> to download your files.</p>\"\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The first part of a key:value pair that forms a tag associated with a given resource. For example, in the tag âDepartmentâ:âSalesâ, the key is 'Department'.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The second part of a key:value pair that forms a tag associated with a given resource. For example, in the tag âDepartmentâ:âSalesâ, the value is 'Sales'.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A key:value pair that adds metadata to a resource used by Amazon Transcribe. For example, a tag with the key:value pair âDepartmentâ:âSalesâ might be added to a resource to indicate its use by your organization's sales department.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":200,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":200,\
      \"min\":1\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TranscribeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want to tag. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code> (for example, <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>). Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags you are assigning to a given Amazon Transcribe resource.</p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"TimestampMilliseconds\":{\
      \"type\":\"long\",\
      \"max\":14400000,\
      \"min\":0\
    },\
    \"TranscribeArn\":{\
      \"type\":\"string\",\
      \"max\":1011,\
      \"min\":1,\
      \"pattern\":\"arn:aws(-[^:]+)?:transcribe:[a-zA-Z0-9-]*:[0-9]{12}:[a-zA-Z-]*/[0-9a-zA-Z._-]+\"\
    },\
    \"Transcript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the transcript.</p> <p>Use this URI to access the transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>\"\
        },\
        \"RedactedTranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the redacted transcript.</p> <p>Use this URI to access the redacted transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the location of a transcription.</p>\"\
    },\
    \"TranscriptFilter\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranscriptFilterType\",\
        \"Targets\"\
      ],\
      \"members\":{\
        \"TranscriptFilterType\":{\
          \"shape\":\"TranscriptFilterType\",\
          \"documentation\":\"<p>Matches the phrase to the transcription output in a word for word fashion. For example, if you specify the phrase \\\"I want to speak to the manager.\\\" Amazon Transcribe attempts to match that specific phrase to the transcription.</p>\"\
        },\
        \"AbsoluteTimeRange\":{\
          \"shape\":\"AbsoluteTimeRange\",\
          \"documentation\":\"<p>A time range, set in seconds, between two points in the call.</p>\"\
        },\
        \"RelativeTimeRange\":{\
          \"shape\":\"RelativeTimeRange\",\
          \"documentation\":\"<p>An object that allows percentages to specify the proportion of the call where you would like to apply a filter. For example, you can specify the first half of the call. You can also specify the period of time between halfway through to three-quarters of the way through the call. Because the length of conversation can vary between calls, you can apply relative time ranges across all calls.</p>\"\
        },\
        \"ParticipantRole\":{\
          \"shape\":\"ParticipantRole\",\
          \"documentation\":\"<p>Determines whether the customer or the agent is speaking the phrases that you've specified.</p>\"\
        },\
        \"Negate\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If <code>TRUE</code>, the rule that you specify is applied to everything except for the phrases that you specify.</p>\"\
        },\
        \"Targets\":{\
          \"shape\":\"StringTargetList\",\
          \"documentation\":\"<p>The phrases that you're specifying for the transcript filter to match.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Matches the output of the transcription to either the specific phrases that you specify, or the intent of the phrases that you specify.</p>\"\
    },\
    \"TranscriptFilterType\":{\
      \"type\":\"string\",\
      \"enum\":[\"EXACT\"]\
    },\
    \"TranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz (Hz), of the audio track in the input media file.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for the transcription job.</p>\"\
        },\
        \"Transcript\":{\
          \"shape\":\"Transcript\",\
          \"documentation\":\"<p>An object that describes the output of the transcription job.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job started processing.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job completed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p> <p>The <code>FailureReason</code> field can contain one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code> - The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code> - The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code> - The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8,000 and 48,000 Hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code> - The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid file size: file size too large</code> - The size of your audio file is larger than Amazon Transcribe can process. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Limits</a> in the <i>Amazon Transcribe Developer Guide</i>.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code> - Your audio contains more channels than Amazon Transcribe is configured to process. To request additional channels, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe\\\">Amazon Transcribe Limits</a> in the <i>Amazon Web Services General Reference</i>.</p> </li> </ul>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>Optional settings for the transcription job. Use these settings to turn on speaker recognition, to set the maximum number of speakers that should be identified and to specify a custom vocabulary to use when processing the transcription job.</p>\"\
        },\
        \"ModelSettings\":{\
          \"shape\":\"ModelSettings\",\
          \"documentation\":\"<p>An object containing the details of your custom language model.</p>\"\
        },\
        \"JobExecutionSettings\":{\
          \"shape\":\"JobExecutionSettings\",\
          \"documentation\":\"<p>Provides information about how a transcription job is executed.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>An object that describes content redaction settings for the transcription job.</p>\"\
        },\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>A value that shows if automatic language identification was enabled for a transcription job.</p>\"\
        },\
        \"LanguageOptions\":{\
          \"shape\":\"LanguageOptions\",\
          \"documentation\":\"<p>An object that shows the optional array of languages inputted for transcription jobs with automatic language identification enabled.</p>\"\
        },\
        \"IdentifiedLanguageScore\":{\
          \"shape\":\"IdentifiedLanguageScore\",\
          \"documentation\":\"<p>A value between zero and one that Amazon Transcribe assigned to the language that it identified in the source audio. Larger values indicate that Amazon Transcribe has higher confidence in the language it identified.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>A key:value pair assigned to a given transcription job.</p>\"\
        },\
        \"Subtitles\":{\
          \"shape\":\"SubtitlesOutput\",\
          \"documentation\":\"<p>Generate subtitles for your batch transcription job.</p>\"\
        },\
        \"LanguageIdSettings\":{\
          \"shape\":\"LanguageIdSettingsMap\",\
          \"documentation\":\"<p>Language-specific settings that can be specified when language identification is enabled for your transcription job. These settings include <code>VocabularyName</code>, <code>VocabularyFilterName</code>, and <code>LanguageModelName</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an asynchronous transcription job that was created with the <code>StartTranscriptionJob</code> operation. </p>\"\
    },\
    \"TranscriptionJobName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"TranscriptionJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUED\",\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"TranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TranscriptionJobSummary\"}\
    },\
    \"TranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job started processing.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job. When the status is <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation to get the results of the transcription.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a description of the error.</p>\"\
        },\
        \"OutputLocationType\":{\
          \"shape\":\"OutputLocationType\",\
          \"documentation\":\"<p>Indicates the location of the output of the transcription job.</p> <p>If the value is <code>CUSTOMER_BUCKET</code> then the location is the S3 bucket specified in the <code>outputBucketName</code> field when the transcription job was started with the <code>StartTranscriptionJob</code> operation.</p> <p>If the value is <code>SERVICE_BUCKET</code> then the output is stored by Amazon Transcribe and can be retrieved using the URI in the <code>GetTranscriptionJob</code> response's <code>TranscriptFileUri</code> field.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>The content redaction settings of the transcription job.</p>\"\
        },\
        \"ModelSettings\":{\"shape\":\"ModelSettings\"},\
        \"IdentifyLanguage\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Whether automatic language identification was enabled for a transcription job.</p>\"\
        },\
        \"IdentifiedLanguageScore\":{\
          \"shape\":\"IdentifiedLanguageScore\",\
          \"documentation\":\"<p>A value between zero and one that Amazon Transcribe assigned to the language it identified in the source audio. A higher score indicates that Amazon Transcribe is more confident in the language it identified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary of information about a transcription job.</p>\"\
    },\
    \"Type\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CONVERSATION\",\
        \"DICTATION\"\
      ]\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"TranscribeArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want to remove tags from. ARNs have the format <code>arn:partition:service:region:account-id:resource-type/resource-id</code> (for example, <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>). Valid values for <code>resource-type</code> are: <code>transcription-job</code>, <code>medical-transcription-job</code>, <code>vocabulary</code>, <code>medical-vocabulary</code>, <code>vocabulary-filter</code>, and <code>language-model</code>.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>A list of tag keys you want to remove from a specified Amazon Transcribe resource.</p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateCallAnalyticsCategoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CategoryName\",\
        \"Rules\"\
      ],\
      \"members\":{\
        \"CategoryName\":{\
          \"shape\":\"CategoryName\",\
          \"documentation\":\"<p>The name of the analytics category to update. The name is case sensitive. If you try to update a call analytics category with the same name as a previous category you will receive a <code>ConflictException</code> error.</p>\"\
        },\
        \"Rules\":{\
          \"shape\":\"RuleList\",\
          \"documentation\":\"<p>The rules used for the updated analytics category. The rules that you provide in this field replace the ones that are currently being used.</p>\"\
        }\
      }\
    },\
    \"UpdateCallAnalyticsCategoryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"CategoryProperties\":{\
          \"shape\":\"CategoryProperties\",\
          \"documentation\":\"<p>The attributes describing the analytics category. You can see information such as the rules that you've used to update the category and when the category was originally created.</p>\"\
        }\
      }\
    },\
    \"UpdateMedicalVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to update. The name is case sensitive. If you try to update a vocabulary with the same name as a vocabulary you've already made, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the language used for the entries in the updated vocabulary. U.S. English (en-US) is the only valid language code in Amazon Transcribe Medical.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The location in Amazon S3 of the text file that contains your custom vocabulary. The URI must be in the same Amazon Web Services Region as the resource that you are calling. The following is the format for a URI:</p> <p> <code>https://s3.aws-region.amazonaws.com/bucket-name/keyprefix/objectkey</code> </p> <p>For example:</p> <p> <code>https://s3.us-east-1.amazonaws.com/DOC-EXAMPLE-BUCKET/vocab.txt</code> </p> <p>For more information about Amazon S3 object names, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies in Amazon Transcribe Medical, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-med.html\\\">Medical Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateMedicalVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the updated vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language of the text file used to update the custom vocabulary. US English (en-US) is the only language supported in Amazon Transcribe Medical.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was updated.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the update to the vocabulary. When the <code>VocabularyState</code> field is <code>READY</code>, the vocabulary is ready to be used in a <code>StartMedicalTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to update. If you try to update a vocabulary filter with the same name as another vocabulary filter, you get a <code>ConflictException</code> error.</p>\"\
        },\
        \"Words\":{\
          \"shape\":\"Words\",\
          \"documentation\":\"<p>The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a>.</p> <p>If you provide a list of words in the <code>Words</code> parameter, you can't use the <code>VocabularyFilterFileUri</code> parameter.</p>\"\
        },\
        \"VocabularyFilterFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html\\\">Character Sets for Custom Vocabularies</a>.</p> <p>The specified file must be less than 50 KB of UTF-8 characters.</p> <p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the updated vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary filter was updated.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to update. The name is case sensitive. If you try to update a vocabulary with the same name as a previous vocabulary you will receive a <code>ConflictException</code> error.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries. For a list of languages and their corresponding language codes, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html\\\">Supported languages</a>.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings containing the vocabulary entries.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p> <p> <code>https://s3.aws-region.amazonaws.com/bucket-name/keyprefix/objectkey</code> </p> <p>For example:</p> <p> <code>https://s3.us-east-1.amazonaws.com/DOC-EXAMPLE-BUCKET/vocab.txt</code> </p> <p>For more information about S3 object names, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html\\\">Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary that was updated.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was updated.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"Uri\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1,\
      \"pattern\":\"(s3://|http(s*)://).+\"\
    },\
    \"Vocabularies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyInfo\"}\
    },\
    \"VocabularyFilterInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter. The name must be unique in the account that holds the filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a vocabulary filter.</p>\"\
    },\
    \"VocabularyFilterMethod\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"remove\",\
        \"mask\",\
        \"tag\"\
      ]\
    },\
    \"VocabularyFilterName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyFilterInfo\"}\
    },\
    \"VocabularyInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. If the state is <code>READY</code> you can use the vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a custom vocabulary.</p>\"\
    },\
    \"VocabularyName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"READY\",\
        \"FAILED\"\
      ]\
    },\
    \"Word\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Words\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Word\"},\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<p>Operations and objects for transcribing speech to text.</p>\"\
}\
";
}

@end
