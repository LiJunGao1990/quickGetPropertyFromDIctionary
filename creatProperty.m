/** 生成字典对应的模型属性声明 */
- (void)createDeclareStringWithDict:(NSDictionary *)dict {

  NSMutableString *strM = [NSMutableString string];

  // [NSString stringWithFormat:@"<%@: %p> {teamAId: %@, spZjq: %@}",
  // self.class, self, _teamAId, _spZjq];
  NSMutableString *descHeadM = [NSMutableString stringWithString:@"<%@: %p> {"];
  NSMutableString *descValuesM =
      [NSMutableString stringWithString:@", self.class, self, "];

  [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
      NSString *typeStr = nil;

      // JSON反序列化后， "<null>" 对应的 类型是 [NSNull class]
      if ([obj isKindOfClass:[NSNumber class]]) {
        typeStr = @"@property (nonatomic, copy) NSNumber *";
      } else {
        typeStr = @"@property (nonatomic, copy) NSString *";
      }

      [strM appendFormat:@"%@%@;\n", typeStr, key];
      [descHeadM appendFormat:@"%@: %%@, ", key];
      [descValuesM appendFormat:@"_%@, ", key];
  }];
  NSLog(@"%@", strM);
  NSString *head = [descHeadM substringToIndex:descHeadM.length - 2];
  NSLog(@"%@", head);
  NSString *values = [descValuesM substringToIndex:descValuesM.length - 2];
  NSLog(@"%@", values);
}