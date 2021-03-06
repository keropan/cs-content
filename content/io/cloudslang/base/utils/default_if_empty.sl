########################################################################################################################
#!!
#! @description: This operation checks if a string is blank or empty and if it's true
#!               a default value will be assigned instead of the initial string.
#!
#! @input initial_value: The initial string.
#!                       Optional
#! @input default_value: The default value used to replace the initial string.
#! @input trim: A variable used to check if the initial string is blank or empty.
#!              Default: 'true'
#!              Optional
#!
#! @output return_result: This will contain the replaced string with the default value.
#! @output return_code: The returnCode of the operation: 0 for success, -1 for failure.
#! @output exception: In case of success response, this result is empty.
#!                    In case of failure response, this result contains the java stack trace of the runtime exception.
#!
#! @result SUCCESS: The operation completed successfully.
#! @result FAILURE: An error occurred during execution.
#!!#
########################################################################################################################

namespace: io.cloudslang.base.utils

operation: 
  name: default_if_empty
  
  inputs: 
    - initial_value:  
        required: false  
    - initialValue: 
        default: ${get('initial_value', '')}  
        required: false 
        private: true 
    - default_value    
    - defaultValue: 
        default: ${get('default_value', '')}  
        required: false 
        private: true 
    - trim:
        default: 'true'
        required: false  
    
  java_action: 
    gav: 'io.cloudslang.content:cs-utilities:0.1.0'
    class_name: 'io.cloudslang.content.utilities.actions.DefaultIfEmpty'
    method_name: 'execute'
  
  outputs: 
    - return_result: ${returnResult}
    - return_code: ${returnCode}
    - exception
  
  results: 
    - SUCCESS: ${returnCode=='0'} 
    - FAILURE
