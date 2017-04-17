//
//  TodayViewController.m
//  NakedJokes
//
//  Created by IMAC  on 19.12.14.
//  Copyright (c) 2014 Dmitriy Karachentsov. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "TodayDataManager.h"
#import "TodayWord.h"


@interface TodayViewController () <NCWidgetProviding, TodayDataManagerProtocol>
@property (strong, nonatomic) NSString *joke;
@property (strong, nonatomic) IBOutlet UILabel *textView;
@property (strong, nonatomic) IBOutlet UILabel *buttonLabel;
@property (strong, nonatomic) UIButton *launchButton;


@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSDate *lastJokeUpdate = [def objectForKey:@"date"];
    NSDate *currentDate = [NSDate date];
       
    if(lastJokeUpdate)
    {
        NSTimeInterval interval = [currentDate timeIntervalSinceDate:lastJokeUpdate];
        if(interval > 60*60*24)
        {
            [TodayDataManager sharedInstance].delegate = self;
            [[TodayDataManager sharedInstance] getWordsWithPackID:16];
            [def setObject:currentDate forKey:@"date"];
        }
        else
        {
            NSString *joke = [def objectForKey:@"joke"];
            [self.textView setText:[self replaceHTMLNewLineTagWithSpecialSymbol:joke]];
        }
    }
    else
    {
        [TodayDataManager sharedInstance].delegate = self;
        [[TodayDataManager sharedInstance] getWordsWithPackID:16];
        [def setObject:currentDate forKey:@"date"];
    }
    
    if([NSLocalizedString(@"lang", nil) isEqualToString:@"en"])
    {
        [self.buttonLabel setText:@"Show all"];
    }
    else
    {
        [self.buttonLabel setText:@"Показать все"];
    }
    //NSLog(@"lang = %@", NSLocalizedString(@"lang", nil));
    /*
    self.joke = @"一对夫妇参观一个养牛场, 农场主为他们介绍，说:\n\
    “这头公牛一星期可交配三次”\n\
    老婆回头瞪了一眼丈夫说：“你看人家”\n\
    到第二头公牛前，农场主说：“这头牛一星期交配五次”\n\
    老婆又瞪了丈夫说 “你看人家”\n\
    到了第三头牛跟前, 农场主说：“这头牛一星期里天天都可交配”\n\
    老公问农场主：“你这公牛每天是跟不同的母牛交配呢, 还是同一头母牛？”\n\
    农场主：“当然不同的母牛了”\n\
    老公对老婆大吼：“你看人家！” ";
    [self.textView setText:self.joke];
     */
   
    //self.launchButton = [[UIButton alloc] initWithFrame:self.textView.frame];
    //[self.launchButton setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.3f]];
    //[self.view addSubview:self.launchButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)ncDataManagerProtocolGetWordsWithPackID:(NSArray *)arrayOfWords
{
    if(arrayOfWords.count > 0)
    {
        TodayWord *word = arrayOfWords.lastObject;
        [self updateNumberLabelText:word];
        self.joke = word.material.materialZH;
         NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        [def setObject:self.joke forKey:@"joke"];
        [def synchronize];
    }
}
- (void)updateNumberLabelText:(TodayWord *)word {
    
    [self.textView setText:[self replaceHTMLNewLineTagWithSpecialSymbol:[NSString stringWithFormat:@"%@", word.material.materialZH]]];
    //self.numberLabel.text = [NSString stringWithFormat:@"%d", number];
    
}

- (NSString *) replaceHTMLNewLineTagWithSpecialSymbol:(NSString *) str
{
    NSString *res = [str stringByReplacingOccurrencesOfString:@"<br />" withString:@"\n"];
    return res;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    completionHandler(NCUpdateResultNewData);
}
- (IBAction)showAllPressed:(id)sender
{
    NSLog(@"%@", NSStringFromCGRect(self.launchButton.frame));
    if([sender tag] == 0)
    {
        [self.textView setNumberOfLines:0];
        [sender setTag:1];
        if([ NSLocalizedString(@"lang", nil) isEqualToString:@"en"])
        {
            [self.buttonLabel setText:@"Open the App"];
        }
        else
        {
            [self.buttonLabel setText:@"Открыть приложение"];
        }
    }
    else
    {
        [self launchApp];
        [sender setTag:0];
    }
}

- (void) launchApp
{
    NSURL *pjURL = [NSURL URLWithString:@"nakedchinese://?1"];
    [self.extensionContext openURL:pjURL completionHandler:nil];
}

- (IBAction)launchHostingApp:(id)sender
{
    NSURL *pjURL = [NSURL URLWithString:@"nakedchinese://?1"];
    [self.extensionContext openURL:pjURL completionHandler:nil];
}


@end
