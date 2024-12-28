//
//  ViewController.m
//  LearningOC1
//
//  Created by  whatsup on 2024/11/4.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import <objc/runtime.h>
#import "FirstClass.h"
#import "YYModel.h"
#import "MJExtension.h"
#import "CommonProtocol.h"
#import "UIButton+EdgeInset.h"
#import "CustomButton.h"
#import "TableViewCell.h"
#import "MJRefresh/MJRefresh.h"

@interface ViewController ()<MyProtocol, UITableViewDelegate, UITableViewDataSource>
//@property (strong, nonatomic) SecondViewController *vc;
@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSString *string1;
@property (nonatomic, strong) NSString *string2;
@property (nonatomic, strong) NSString *string3;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) FirstClass *firstClass;
@property (nonatomic, strong) NSMutableArray *arrays;
@property (nonatomic, retain) NSNumber *counter;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

@synthesize pd = _pd;

- (NSString *)pd {
    return _pd;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.string = @"11";
    //    NSString *aString = @"222";
    
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.titleLabel.text = @"Button";
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSLog(@"%d", [self.autoContentAccessingProxy beginContentAccess]);
    
    
    BOOL isConformProtocol = [ViewController conformsToProtocol:@protocol(MyProtocol)];
    NSLog(@"%d", isConformProtocol);
    
    [self dosomething];
    
    BOOL isIncludeFunc = [ViewController instancesRespondToSelector:@selector(classFunction)];
    BOOL isIncludeFunc1 = [ViewController instancesRespondToSelector:@selector(viewWillAppear:)];
    NSLog(@"%d %d include func", isIncludeFunc, isIncludeFunc1);
    
    IMP imp = [self methodForSelector:@selector(clickButton:)];
    IMP imp1 = [ViewController instanceMethodForSelector:@selector(clickButton:)];
    NSLog(@"%p %p", imp, imp1); // 获取指向方法的地址指针
    
    NSMethodSignature *sign = [ViewController instanceMethodSignatureForSelector:@selector(clickButton:)];
    NSMethodSignature *sign1 = [self methodSignatureForSelector:@selector(clickButton:)];
    NSLog(@"%@", sign1);
    //    const char *a = [sign getArgumentTypeAtIndex: 1];
    if (sign) {
        NSLog(@"%@", NSStringFromSelector(@selector(clickButton:)));
    }
    
    NSLog(@"%@", [ViewController description]);
    
    //    [self performSelector:@selector(clickButton:) withObject:nil afterDelay:1.5];
    //    [self performSelector:@selector(classFunction) withObject:nil afterDelay:1 inModes:@[NSRunLoopCommonModes]];
    
    //    [ViewController cancelPreviousPerformRequestsWithTarget:self selector:@selector(clickButton:) object:nil];
    
    //    BOOL wait = true; // 等待当前线程执行完执行
    //    [self performSelectorOnMainThread:@selector(dosomething) withObject:nil waitUntilDone: wait];
    //    [self performSelectorOnMainThread:@selector(dosomething) withObject:nil waitUntilDone:wait modes:@[NSDefaultRunLoopMode]];
    
    //    [self performSelectorInBackground:@selector(dosomething) withObject:nil];
    //    NSString * _Nullable a = [self forwardingTargetForSelector:@selector(dosomething)];
    //    a = [self forwardingTargetForSelector:@selector(clickButton:)];
    //    NSLog(@"%@", a);
    //    if (a) {
    //        NSLog(@"a is not empty");
    //    }
    
    //    NSInvocation *invocation = [[NSInvocation alloc] init];
    //    invocation.selector = @selector(dosomething);
    //    [self forwardInvocation:invocation];
    // 执行一个不存在的方法 resolveClassMethod 会调用你生成的方法
    //    [self performSelector:NSSelectorFromString(@"resolveThisMethodDynamically") withObject:nil];
    
    //    const char *class = class_getName([ViewController class]);
    //    Class _Nullable as = class_getSuperclass([ViewController class]);
    //    BOOL aclass = class_isMetaClass([ViewController class]);
    //    NSLog(@"%s %@ %d", class, [as description], aclass);
    //    size_t size = class_getInstanceSize([ViewController class]);
    //    size_t size1 = class_getInstanceSize([SecondViewController class]);
    //    NSLog(@"%zu %zu", size, size1);
    
    //    NSCoder *coder = [NSCoder new];
    //    NSLog(@"%@ %@ %@", [self awakeAfterUsingCoder:coder], self.classForCoder, self.classForKeyedArchiver);
    //    [ViewController setVersion:100];
    //    NSLog(@"%ld", (long)ViewController.version);
    //
    //    [self addObserver:self forKeyPath:@"string" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    //    [self addObserver:self forKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    //     |NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionPrior
    //    [self removeObserver:self forKeyPath:@"string" context:nil];
    //    self.string = @"xx";
    
    //    [self willChangeValueForKey:@"string"];
    //    self.array = [@[@"1", @"2"] mutableCopy];
    //    self.view.backgroundColor = UIColor.redColor;
    //    [self addObserver:self forKeyPath:@"array" options:NSKeyValueChangeSetting|NSKeyValueChangeInsertion|NSKeyValueChangeRemoval|NSKeyValueChangeReplacement context:nil];
    
    //    [self.array insertObject:@"5" atIndex:2];
    //    [self willChange:NSKeyValueChangeSetting valuesAtIndexes:[NSIndexSet indexSetWithIndex:1] forKey:@"array"];
    //
    //    [self.array removeObjectAtIndex:1];
    
    //    NSLog(@"%d %d", button.isAccessibilityElement, coder.allowsKeyedCoding);
    
    //    button.isAccessibilityElement = YES;
    //    button.accessibilityLabel = @"done button";
    //    button.accessibilityHint = @"this is a normal button";
    //    button.accessibilityTraits = UIAccessibilityTraitButton;
    //    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 300, 50)];
    //    tf.text = @"dadadadad";
    //    tf.accessibilityValue = tf.text;
    //    [self.view addSubview:tf];
    //
    //    NSLog(@"%d", [ViewController automaticallyNotifiesObserversForKey:@"array"]);
    //    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"/Documents/path"];
    
    //    [NSKeyedArchiver archiveRootObject:self toFile:path];
    //    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:true error:nil];
    //    NSLog(@"%d", [self.classForCoder decodeBoolForKey:@"bool"]);
    //    [self encodeWithCoder:coder];
    //    NSLog(@"%@", data);
    
    //    [self addObserver:self forKeyPath:@"string2" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    //    self.string1 = @"112312";
    //    self.string2 = @"xxx";
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        self.string1 = @"name";
    //
    //        self.string3 = @"good";
    //    });
    //    [self willChangeValueForKey:@"string"];
    //    self.string = @"nm";
    //    [self didChangeValueForKey:@"string"];
    
    NSLog(@"%@", self.observationInfo);
    
    self.firstClass = [FirstClass new];
    self.firstClass.firstSub = [[FirstSubClass alloc] initWithLast:@"AAAA"];
    //    self.firstClass.name = @"first name";
    
    NSString *name = [self.firstClass valueForKey:@"name"];
    NSString *last = [self.firstClass valueForKeyPath:@"firstSub.last"];
    NSLog(@"%@ %@", name, last);
    
    
    //    FirstSubClass *sub = [[FirstSubClass alloc] initWithDicMethod1:@{@"name": @"adsad", @"level": @100, @"age": @10}];
    //    FirstSubClass *sub = [[FirstSubClass alloc] initWithDicMethod2:@{@"name": @"adsad", @"level": @100, @"age": @11}];
    //    FirstSubClass *sub = [[FirstSubClass alloc] initWithDicMethod3:@{@"name": @"adsad", @"level": @100, @"age": @10}];
    FirstSubClass *sub = [[FirstSubClass alloc] initWithDicMethod4:@{@"name": @"adsad", @"level": @100, @"age": @10, @"bif": @"1"}];
    NSLog(@"%@ %@ %ld", sub.name, sub.level, sub.age);
    // vv crash
    //    NSLog(@"%@ %@", [sub valueForKey:@"name"], [sub dictionaryWithValuesForKeys:@[@"name", @"level", @"vv"]]);
    
    //  add object 内存地址是不变的
    //    self.arrays = [@[@"1"] mutableCopy];
    //    NSLog(@"%p %p", _arrays, &_arrays);
    //    [_arrays addObject:@"2"];
    //    NSLog(@"%p %p", _arrays, &_arrays);
    //
    //    NSMutableArray *array1 = [self mutableArrayValueForKey:@"arrays"];
    //    [array1 addObject:@"2"];
    //    NSLog(@"%p %p", array1, &array1);
    //
    //    [self.arrays removeAllObjects];
    //    [self.arrays addObject:sub];
    //    NSLog(@"%@", [self mutableArrayValueForKeyPath:@"arrays.name"]);
    //    [sub setValue:nil forKey:@"number"];
    //    NSLog(@"%@", [sub valueForKey:@"number"]);
    //
    NSString *jsonString = @"{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}";
    //    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    //    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    //    NSLog(@"%@", dictionary);
    
    
    // CFApplyFunction core Foundation的方法 dic里每一对元素都执行Applier方法-setter方法  context包含3层 Meta Model 仅包含属性和class信息 model原始模型 dic数据
    FirstSubClass *subclass = [FirstSubClass yy_modelWithJSON:jsonString];
    NSLog(@"%@", subclass.name);
    
    FirstSubClass *subclass1 = [FirstSubClass mj_objectWithKeyValues:jsonString];
    NSLog(@"%@", subclass1.name);
    
    NSLog(@"%d", [self isEqual: self]);
    // isequal 必须hash相同
    NSLog(@"%lu %lu", subclass1.hash, subclass.hash);
    
    NSLog(@"%d", [self isKindOfClass:[ViewController class]]);
    NSLog(@"%d", [FirstClass isMemberOfClass:[ViewController class]]);
    //    NSDictionary *dict = @{
    //        @"id" : @"20",
    //        @"desciption" : @"好孩子",
    //        @"name" : @{
    //            @"newName" : @"lufy",
    //            @"oldName" : @"kitty",
    //            @"info" : @[
    //                @"test-data",
    //                @{@"nameChangedTime" : @"2013-08-07"}
    //            ]
    //        },
    //        @"other" : @{
    //            @"bag" : @{
    //                @"name" : @"小书包",
    //                @"price" : @100.7
    //            }
    //        }
    //    };
    
    [self classFunction];
    [self performSelector:@selector(classFunction)];
    [self performSelector:sel_getUid("classFunction")];
    
    [self performSelector:@selector(setsSomething:) withObject:@"11"];
    
    NSLog(@"%d", self.isProxy);
    
    const char *subClass = class_getName([FirstSubClass class]);
    Class subclasses = class_getSuperclass([FirstSubClass class]);
    BOOL isMetaClass = class_isMetaClass([FirstClass class]);
    size_t classSize = class_getInstanceSize([FirstClass class]);
    Ivar var = class_getInstanceVariable([FirstSubClass class], "_var");
    //    This function may only be called after objc_allocateClassPair and before objc_registerClassPair. Adding an instance variable to an existing class is not supported.
    BOOL isCreated = class_addIvar([FirstSubClass class], "instances", sizeof(NSString *), log2(sizeof(NSString *)), "@");
    
    Class newClass = objc_allocateClassPair(NSObject.class, "TempClass", 0);
    BOOL isNewClass = class_addIvar(newClass, "_instances", sizeof(NSString *), log2(sizeof(NSString *)), "@");
    NSLog(@"%d", isNewClass);
    objc_registerClassPair(newClass);
    
    Ivar instan = class_getInstanceVariable(newClass, "_instances");
    NSLog(@"%s", ivar_getName(instan));
    
    subclass->_var = @"good instance";
    subclass->_firstVar = @"XXXX";
    
    NSLog(@"%s %@ %d %ld %s %@ %p %d", subClass, subclasses, isMetaClass, classSize, ivar_getName(var), subclass->_var, &subclass->_var, isCreated);
    
    unsigned int counts = 0;
    Ivar *ivar = class_copyIvarList([FirstSubClass class], &counts);
    NSLog(@"%d", counts);
    for (int i = 0; i < counts; i++) {
        NSLog(@"%s %s", ivar_getName(ivar[i]), ivar_getTypeEncoding(ivar[i]));
    }
    
    const uint8_t *numbers = class_getIvarLayout([FirstSubClass class]);
    NSLog(@"%s", numbers);
    
    objc_property_t pro = class_getProperty([FirstSubClass class], "name");
    NSLog(@"%s", property_getName(pro));
    
    unsigned int count = 0;
    objc_property_t *proArray = class_copyPropertyList([FirstSubClass class], &count);
    for (int i = 0; i < count; i++) {
        NSLog(@"%s", property_getName(proArray[i]));
    }
    IMP imps = class_getMethodImplementation([ViewController class], @selector(setsSomething:));
    const char *mt = method_getTypeEncoding(class_getInstanceMethod([ViewController class], @selector(setsSomething:)));
    NSLog(@"%s", mt);
    BOOL av = class_addMethod([FirstSubClass class], @selector(clickMethod:), imps, mt);
    NSLog(@"%d", av);
    FirstSubClass *subcc = [[FirstSubClass alloc] init];
    [subcc performSelector:@selector(clickMethod:) withObject:@"ss"];
    
    Method met = class_getInstanceMethod([ViewController class], @selector(setsSomething:));
    NSLog(@"%s", method_getName(met));
    
    Method mt1 = class_getClassMethod([ViewController class], @selector(getOneMethod));
    NSLog(@"%s", sel_getName(method_getName(mt1)));
    
    NSLog(@"------------------------------------------------    ");
    
    unsigned int outCount = 0;
    Method *mtarray = class_copyMethodList([ViewController class], &outCount);
    for (int i = 0; i < outCount; i++) {
        NSLog(@"%s", sel_getName(method_getName(mtarray[i])));
    }
    
    
    class_replaceMethod([ViewController class], @selector(clickThisOne:), method_getImplementation(met), method_getTypeEncoding(met));
    
    [self performSelector:@selector(setsSomething:) withObject:@"11001"];
    [self performSelector:@selector(clickThisOne:) withObject:@"213123"];
    
    IMP a = class_getMethodImplementation(self.class, @selector(clickThisOne:));
    NSLog(@"%p", a);
    
    BOOL isSel = class_respondsToSelector(self.class, @selector(clickThisOne:));
    NSLog(@"%d", isSel);
    
    BOOL isAdd = class_addProtocol(self.class, @protocol(Aprotocol));
    NSLog(@"%d", isAdd);
    [self performSelector:@selector(getMaskToRect)];
    
    objc_property_attribute_t type = {"T", "@\"NSString\""};
    objc_property_attribute_t strongs = {"&", ""}; //strong
    objc_property_attribute_t nonamitic = {"N", ""};
    objc_property_attribute_t ivars = {"V", "_team"};
    objc_property_attribute_t attr[] = {type, strongs, nonamitic, ivars};
    class_addProperty(self.class, "team", attr, 4);
    
    unsigned int counted;
    objc_property_t *propertyList = class_copyPropertyList([self class], &counted);
    for (unsigned int i = 0; i< counted; i++) {
        const char *name = property_getName(propertyList[i]);
        NSLog(@"__%@",[NSString stringWithUTF8String:name]);
        objc_property_t property = propertyList[i];
        const char *a = property_getAttributes(property);
        NSLog(@"属性信息__%@",[NSString stringWithUTF8String:a]);
    }
    
    objc_property_attribute_t type1 = {"T", "@\"Int\""};
    objc_property_attribute_t strong1 = {"C", ""}; //strong
    objc_property_attribute_t nonamitic1 = {"N", ""};
    objc_property_attribute_t ivars1 = {"V", "_team"};
    objc_property_attribute_t attr1[] = {type1, strong1, nonamitic1, ivars1};
    
    class_replaceProperty(self.class, "team", attr1, 4);
    for (unsigned int i = 0; i < counted; i++) {
        const char *name = property_getName(propertyList[i]);
        NSLog(@"%@",[NSString stringWithUTF8String:name]);
        objc_property_t property = propertyList[i];
        const char *a = property_getAttributes(property);
        NSLog(@"属性信息 %@",[NSString stringWithUTF8String:a]);
    }
    
    BOOL isconform = class_conformsToProtocol(self.class, @protocol(Aprotocol));
    NSLog(@"%d", isconform);
    unsigned int outNumber = 0;
    Protocol * __unsafe_unretained *pros = class_copyProtocolList(self.class, &outNumber);
    for (unsigned int i = 0; i < outNumber; i++) {
        NSLog(@"%s", protocol_getName(pros[i]));
    }
    
    int ver = class_getVersion(self.class);
    NSLog(@"%d", ver);
    
    size_t bytes = 0;
    Class clsses = objc_allocateClassPair(NSObject.class, "Aclass", bytes);
    objc_registerClassPair(clsses); // 注册到内存
    objc_disposeClassPair(clsses); // 释放
    
    id clses = class_createInstance([UIViewController class], 0);
    NSLog(@"%@", clses);
    
    //    NSObject *objs = [NSObject new];
    //    NSObject *bj = object_copy(objs, 0);
    //    NSLog(@"%p %p", &objs)
    
    int ls = objc_getClassList(NULL, 0);
    Class *cllas = objc_copyClassList(&counted);
    NSLog(@"%d", ls);
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.safeAreaInsets.top, self.view.frame.size.width, UIScreen.mainScreen.bounds.size.height - self.view.safeAreaInsets.top - self.view.safeAreaInsets.bottom) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cells"];
    [self.view addSubview: self.tableView];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                 
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                  [self.tableView.mj_header endRefreshing];
        });
    }];
    
    self.arrays = [@[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10] mutableCopy];
    
    [self.tableView reloadData];
    
    UIButton *btns = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [btns setEdgeInsets: @5];
    [self.view addSubview:btns];
    
    NSLog(@"%@", [btns getEdgeInsets]);
    
    CustomButton *buttons = [[CustomButton alloc] initWithFrame:CGRectMake(200, 200, 100, 50)];
    buttons.backgroundColor = [UIColor blueColor];
    [buttons addTarget:self action:@selector(clickCustom) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttons];
    
    char returnType[100];
    method_getReturnType(mt1, returnType, 100);
    NSLog(@"%s", returnType);
    
    unsigned int metNumber = method_getNumberOfArguments(met);
    NSLog(@"%d", metNumber);
    
    char dst[10];
    for (unsigned int i = 0; i < metNumber; i++) {
        method_getArgumentType(met, i, dst, 10);
        NSLog(@"%s", dst);
    }
    
    struct objc_method_description *add = method_getDescription(met);
    NSLog(@"%s %s", sel_getName(add->name), add->types);
    
    IMP mp = method_setImplementation(mt1, imps); //给method 设置实现 imp
    NSLog(@"%p",  mp);
    
    method_exchangeImplementations(met, mt1);
    
    unsigned int outCounts;
    const char *ad = *objc_copyImageNames(&outCounts);
    NSLog(@"%d %s", outCounts, ad);
    
    const char *title = class_getImageName(self.class);
    NSLog(@"%s", title);
    
    SEL selc = sel_registerName("clickBtnAfter:");
    IMP impc = class_getMethodImplementation(self.class, @selector(impFunction:));
//    BOOL isSuc = class_addMethod(self.class, selc, (IMP)impFunction, "v@:@");
    BOOL isSuc = class_addMethod(self.class, selc, impc, "v@:@");
    NSLog(@"%d", isSuc);
    
    [self performSelector:selc withObject:@"kkk"];
    
    SEL addd = sel_getUid("adadad");
    NSLog(@"%s", sel_getName(addd));
    
    BOOL isSelcEqual = sel_isEqual(selc, selc);
    NSLog(@"%d", isSelcEqual);
    
    
    Protocol *tol = objc_allocateProtocol("Aop");
    objc_registerProtocol(tol);
    Protocol *prosd = objc_getProtocol("Aop");
    NSLog(@"%p %p", tol, prosd);
    unsigned int outs;
//    Protocol __unsafe_unretained **sp = objc_copyProtocolList(&outs);
//    for (unsigned int i = 0; i < outs; i++) {
//        Protocol *p = sp[i];
//        NSLog(@"%s", protocol_getName(p));
//    }
//    free(sp);
    
    SEL asel = sel_registerName("doAnotherThing:");
    protocol_addMethodDescription(tol, asel, "v@:@", true, true);
    
    NSLog(@"----------------------");
    
    struct objc_method_description *prosds = protocol_copyMethodDescriptionList(objc_getProtocol("MyProtocol"), true, true, &outs);
    NSLog(@"%d", outs);
    for (unsigned int i = 0; i < outs; i++) {
        NSLog(@"%s", sel_getName(prosds[i].name));
    }

    NSLog(@"----------------------");
    
    Protocol *mypro = objc_getProtocol("MyProtocol");
    
    objc_property_t *pt = protocol_copyPropertyList(mypro, &outs);
    for (int i = 0; i < outs; i++) {
        NSLog(@"%s", property_getName(pt[i]));
    }
    free(pt);
    
    NSLog(@"----------------------");
    
    objc_property_t pt1 = protocol_getProperty(mypro, "pd", true, true);
    NSLog(@"%s", property_getName(pt1));
    
    NSLog(@"----------------------");
    
    Protocol * __unsafe_unretained *pt2 = protocol_copyProtocolList(mypro, &outs);
    for (int i = 0; i < outs; i++) {
        Protocol *ptTemp = pt2[i];
        NSLog(@"%s", protocol_getName(ptTemp));
    }
    NSLog(@"%s", property_getAttributes(pt1));
    
    NSLog(@"----------------------");
    
    BOOL isConform = protocol_conformsToProtocol(mypro, @protocol(NSObject));
    NSLog(@"%d", isConform);
    
    NSLog(@"%s", property_copyAttributeValue(pt1, "T"));
    
    objc_property_attribute_t *att = property_copyAttributeList(pt1, &outs);
    for (int i = 0; i < outs; i++) {
        NSLog(@"%s", att[i].name);
    }
    free(att);

    int (^impyBlock)(id, int, int) = ^(id self, int a, int b) {
        return a + b;
    };
    NSLog(@"%d", impyBlock(nil, 5, 3));
    
    int (*impst)(id, id, int, int) = (void*) imp_implementationWithBlock(impyBlock);
    NSLog(@"%d", impst(nil, NULL, 1, 10));
}

- (void)impFunction:(NSString *)str {
    NSLog(@"%@", str);
}

void impFunction(id self, SEL _cmd, NSString *str) {
    NSLog(@"%@ %@ %s", self, str, sel_getName(_cmd));
}

- (void)clickCustom {
    [self.arrays addObjectsFromArray:@[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10]];
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cells";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.lab.text = [NSString stringWithFormat:@"Text %li", (long)indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.arrays.count;
}

- (void)clickThisOne:(NSString *)str {
    NSLog(@"dasdasdasdasda222");
}

+ (void)getOneMethod {
    NSLog(@"dada");
}

- (void)doSomeProtocol {
    if ([self respondsToSelector:@selector(dosomething)]) {
        [self.delegate dosomething];
    }
}

// retain +1 release -1
//- (NSNumber *)counter {
//    return 0;
//}
//
//- (void)setCounter:(NSNumber *)newValue {
//    [newValue retain];
//    [self.counter release];
//    self.counter = newValue;
//}

//- (NSString *)string {
//    return [NSString stringWithFormat:@"%@ values", self.string1];
//}
//
//- (NSString *)string2 {
//    return [NSString stringWithFormat:@"%@ %@", self.string1, self.string3];
//}

// 1 对 1
//+ (NSSet<NSString *> *)keyPathsForValuesAffectingString {
//    return [NSSet setWithObjects:@"string1", nil];
//}

// 1 对 多
//+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
//    NSSet *keypath = [super keyPathsForValuesAffectingValueForKey:key];
//    if ([key isEqualToString:@"string2"]) {
//        NSSet *affectkeys = [NSSet setWithObjects:@"string1", @"string3", nil];
//        keypath = [keypath setByAddingObjectsFromSet:affectkeys];
//    }
//    return keypath;
//}

//- (void)willChangeValueForKey:(NSString *)key {
//    NSLog(@"%@ %@", key, self.string);
//    // 不调用 不会call observeValueForKeyPath
////    [super willChangeValueForKey:key];
//}

//- (void)didChangeValueForKey:(NSString *)key {
//    NSLog(@"%@ %@", key, self.string);
////    [super didChangeValueForKey:key];
//}

- (void)setsSomething:(NSString *)number {
    NSLog(@"---- %@", number);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([[object class] isEqual:[ViewController class]]) {
        NSLog(@"%@ %@ %@ %@", keyPath, object, change, context);
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        BOOL aValue = [aDecoder decodeBoolForKey:@"bool"];
        NSLog(@"%d", aValue);
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeBool:YES forKey:@"bool"];
}

- (void)willChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key {
    NSLog(@"%lu %@ %@", (unsigned long)changeKind, indexes, key);
    [super willChange:changeKind valuesAtIndexes:indexes forKey:key];
}

+(BOOL)resolveClassMethod:(SEL)sel{
    NSString *methodName = NSStringFromSelector(sel);
    if ([methodName isEqualToString:@"resolveThisMethodDynamically"]) {
        class_addMethod(object_getClass(self), sel, (IMP)classMethod, "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == NSSelectorFromString(@"resolveThisMethodDynamically"))
    {
          class_addMethod([self class], aSEL, (IMP)classMethod, "v@:");
          return YES;
    }
    return [super resolveInstanceMethod:aSEL];
}

void classMethod(id self, SEL sel){
    NSLog(@"%@",NSStringFromSelector(sel));
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([self respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self];
    }
}


- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(dosomething)) {
        return @"forward something";
    }
    return nil;
}

- (void)clickButton:(UIButton *)render {
    SecondViewController *vc = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
//    ThirdViewController *vc = [ThirdViewController new];
    
    //每个线程都有一个runloop 但是都没有开启 需要手动开启 除了主线程 main的是默认开启的
    // current thread
    [self presentViewController:vc animated:true completion:nil];
    
}

- (void)dealloc {
    NSLog(@"dealloc FirstViewController");
}

// 类方法不包含在内
- (void)classFunction {
    NSLog(@"isIncludeFunc");
}

- (void)dosomething {
    NSLog(@"perform this protocol method %d", [[NSThread currentThread] isMainThread]);
}

@end

// 1.objc_xxx系列函数  宏观使用,如类与协议的空间分配,注册,注销等操作
// 函数名称     函数作用
//objc_getClass     获取Class对象
//objc_getMetaClass     获取MetaClass对象
//objc_allocateClassPair     分配空间,创建类(仅在 创建之后,注册之前 能够添加成员变量)
//objc_registerClassPair     注册一个类(注册后方可使用该类创建对象)
//objc_disposeClassPair     注销某个类
//objc_allocateProtocol     开辟空间创建协议
//objc_registerProtocol     注册一个协议
//objc_constructInstance     构造一个实例对象(ARC下无效)
//objc_destructInstance     析构一个实例对象(ARC下无效)
//objc_setAssociatedObject     为实例对象关联对象
//objc_getAssociatedObje*ct     获取实例对象的关联对象
//objc_removeAssociatedObjects     清空实例对象的所有关联对象
//
//// 2.class_xxx系列函数   类的内部,如实例变量,属性,方法,协议等相关问题
//函数名称     函数作用
//class_addIvar     为类添加实例变量
//class_addProperty     为类添加属性
//class_addMethod     为类添加方法
//class_addProtocol     为类遵循协议
//class_replaceMethod     替换类某方法的实现
//class_getName     获取类名
//class_isMetaClass     判断是否为元类
//objc_getProtocol     获取某个协议
//objc_copyProtocolList     拷贝在运行时中注册过的协议列表
//class_getSuperclass     获取某类的父类
//class_setSuperclass     设置某类的父类
//class_getProperty     获取某类的属性
//class_getInstanceVariable     获取实例变量
//class_getClassVariable     获取类变量
//class_getInstanceMethod     获取实例方法
//class_getClassMethod     获取类方法
//class_getMethodImplementation     获取方法的实现
//class_getInstanceSize     获取类的实例的大小
//class_respondsToSelector     判断类是否实现某方法
//class_conformsToProtocol     判断类是否遵循某协议
//class_createInstance     创建类的实例
//class_copyIvarList     拷贝类的实例变量列表
//class_copyMethodList     拷贝类的方法列表
//class_copyProtocolList     拷贝类遵循的协议列表
//class_copyPropertyList     拷贝类的属性列表
//
//// 3.object_xxx系列函数   对象的角度,如实例变量
//函数名称     函数作用
//object_copy     对象copy(ARC无效)
//object_dispose     对象释放(ARC无效)
//object_getClassName     获取对象的类名
//object_getClass     获取对象的Class
//object_setClass     设置对象的Class
//object_getIvar     获取对象中实例变量的值
//object_setIvar     设置对象中实例变量的值
//object_getInstanceVariable     获取对象中实例变量的值 (ARC中无效,使用object_getIvar)
//object_setInstanceVariable     设置对象中实例变量的值 (ARC中无效,使用object_setIvar)
//
//// 4.method_xxx系列函数   方法内部,如方法的参数及返回值类型和方法的实现
//函数名称     函数作用
//method_getName     获取方法名
//method_getImplementation     获取方法的实现
//method_getTypeEncoding     获取方法的类型编码
//method_getNumberOfArguments     获取方法的参数个数
//method_copyReturnType     拷贝方法的返回类型
//method_getReturnType     获取方法的返回类型
//method_copyArgumentType     拷贝方法的参数类型
//method_getArgumentType     获取方法的参数类型
//method_getDescription     获取方法的描述
//method_setImplementation     设置方法的实现
//method_exchangeImplementations     替换方法的实现
//
//// 5.property_xxx系列函数   属性*内部,如属性的特性等
//函数名称     函数作用
//property_getName     获取属性名
//property_getAttributes     获取属性的特性列表
//property_copyAttributeList     拷贝属性的特性列表
//property_copyAttributeValue     拷贝属性中某特性的值
//
//// 6.protocol_xxx系列函数 协议相关
//函数名称     函数作用
//protocol_conformsToProtocol     判断一个协议是否遵循另一个协议
//protocol_isEqual     判断两个协议是否一致
//protocol_getName     获取协议名称
//protocol_copyPropertyList     拷贝协议的属性列表
//protocol_copyProtocolList     拷贝某协议所遵循的协议列表
//protocol_copyMethodDescriptionList     拷贝协议的方法列表
//protocol_addProtocol     为一个协议遵循另一协议
//protocol_addProperty     为协议添加属性
//protocol_getProperty     获取协议中的某个属性
//protocol_addMethodDescription     为协议添加方法描述
//protocol_getMethodDescription     获取协议中某方法的描述
//
//// 7.ivar_xxx 系列函数  实例变量相关
//函数名称     函数作用
//ivar_getName     获取Ivar名称
//ivar_getTypeEncoding     获取类型编码
//ivar_getOffset     获取偏移量
//
//// 8.sel_xxx系列函数   方法编号相关
//函数名称     函数作用
//sel_getName     获取名称
//sel_getUid     注册方法
//sel_registerName     注册方法名
//sel_isEqual     判断方法是否相等
//
//// 9.imp_xxx系列函数   方法实现相关
//函数名称     函数作用
//imp_implementationWithBlock     通过代码块创建IMP
//imp_getBlock     获取函数指针中的代码块
//imp_removeBlock     移除IMP中的代码块
