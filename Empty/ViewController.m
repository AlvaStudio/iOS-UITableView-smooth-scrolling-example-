//
//  ViewController.m
//  Empty
//
//  Created by Alex Sid on 20.03.16.
//  Copyright (c) 2016 AlvaStudio. All rights reserved.
//

#import "ViewController.h"
#import "FileUtils.h"
#import "CustomCell.h"

@interface ViewController () {
    NSArray *dataArray;
}

@end

@implementation ViewController

@synthesize listView;

-(id)init {
    self = [super init];
    if (self) {
        dataArray = [FileUtils readPlist:@"data.plist"];
        NSLog(@"%@", dataArray);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    listView = [[UITableView alloc] initWithFrame:self.view.bounds
                                            style:UITableViewStylePlain];
    listView.delegate = self;
    listView.dataSource = self;
    [self.view addSubview:listView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell %d",(int)indexPath.row];
    
    CustomCell *cell = (CustomCell*)[listView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSLog(@"Created cell %@", CellIdentifier);
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleValue2
                                  reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        NSDictionary *dict = [dataArray objectAtIndex:indexPath.row];
        cell.titleLabel.text = [dict objectForKey:@"title"];
        cell.descLabel.text = [dict objectForKey:@"desc"];
        
        NSURL *url = [NSURL URLWithString:[dict objectForKey:@"image"]];
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                                 
                                                                 if (data) {
                                                                     NSLog(@"Data - OK");
                                                                     UIImage *image = [UIImage imageWithData:data];
                                                                     if (image) {
                                                                         dispatch_async(dispatch_get_main_queue(),^{
                                                                             cell.iconView.image = image;
                                                                         });
                                                                     }
                                                                 }
                                                                 
                                                                 if (error) {
                                                                     NSLog(@"Error - %@", error);
                                                                 }
                                                                 
                                                             }];
        [task resume];
        
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
