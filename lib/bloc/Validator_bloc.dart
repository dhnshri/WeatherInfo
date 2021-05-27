import 'dart:async';

mixin Validator {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError("This field can not be empty");
      }
      if (email.length > 32) {
        return sink.addError("Email length can not be greater than 32");
      }
      if (email.length < 6) {
        return sink.addError("Email length can not be less than 6");
      }
    },
  );

  /////////////////////////////
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError("This field can not be empty");
      }
      if (email.length < 6) {
        return sink.addError("Email length can not be less than 6");
      }
    },
  );

  /////////////////////////////////////////
  var nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError("This field can not be empty");
      }
    },
  );
  /////////////////////////////////////////////
  var phonenumberValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError("This field can not be empty");
      }
    },
  );
  /////////////////////////////////////////////
  var confirmPasswordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError("This field can not be empty");
      }
    },
  );
}
