#import <Foundation/Foundation.h>

#include <node.h>
#include <nan.h>
#include <iostream>
#include <cstring>

using namespace v8;

void SetFileLocked(const Nan::FunctionCallbackInfo<v8::Value>& info) {

  if (info.Length() < 2) {
    Nan::ThrowTypeError("Wrong number of arguments");
    return;
  }

  if (!info[0]->IsString()) {
      Nan::ThrowTypeError("Path must be a string");
      return;
  }

  if (!info[1]->IsBoolean()) {
      Nan::ThrowTypeError("Locked must be a boolean");
      return;
  }

  const char *path = strcpy(new char[String::Utf8Value(info[0]).length()], *(String::Utf8Value(info[0])));
  bool locked = info[1]->BooleanValue();
  
  BOOL isLocked = locked ? YES : NO;
  
  NSDictionary* attribs = @{ NSFileImmutable: @(isLocked) };
  BOOL result = [[NSFileManager defaultManager]  setAttributes:attribs ofItemAtPath:[NSString stringWithUTF8String:path] error:nil];

  bool res = result ? true : false;
  
  v8::Local<v8::Boolean> returnResult = Nan::New(res);

  info.GetReturnValue().Set(returnResult);
}

void IsFileLocked(const Nan::FunctionCallbackInfo<v8::Value>& info) {
	
  if (info.Length() < 1) {
    Nan::ThrowTypeError("Wrong number of arguments");
    return;
  }

  if (!info[0]->IsString()) {
      Nan::ThrowTypeError("Path must be a string");
      return;
  }

  const char *path = strcpy(new char[String::Utf8Value(info[0]).length()], *(String::Utf8Value(info[0])));
  
  NSError * error;
  NSDictionary *attributes =  [[NSFileManager defaultManager] attributesOfItemAtPath:[NSString stringWithUTF8String:path] error:&error];
  BOOL isLocked = [[attributes objectForKey:@"NSFileImmutable"] boolValue];

  bool res = isLocked ? true : false;
  
  v8::Local<v8::Boolean> returnResult = Nan::New(res);

  info.GetReturnValue().Set(returnResult);
}

void Init(v8::Local<v8::Object> exports) {
	
  exports->Set(Nan::New("setFileLocked").ToLocalChecked(),
               Nan::New<v8::FunctionTemplate>(SetFileLocked)->GetFunction());

  exports->Set(Nan::New("isFileLocked").ToLocalChecked(),
               Nan::New<v8::FunctionTemplate>(IsFileLocked)->GetFunction());
}

NODE_MODULE(macosfs, Init)
	