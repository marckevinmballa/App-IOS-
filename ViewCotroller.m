#import "ViewController.h"
 
@interface ViewController ()
 
@end
 
@implementation ViewController
 
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSError *error = nil;
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://www.xoomdatevent.com/xoomdat-api-search-events/?q=all%20events&search_term_rank_value=5&city=Long%20Beach&city_rank_value=1&start_date=2015-09-26&end_date=2017-10-16"]];
        
    id jsonObjects = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    NSDictionary *feed = [jsonObjects objectForKey:@"feed"];
    NSArray *entries = [feed objectForKey:@"entry"];
        
    NSMutableArray *titles = [[NSMutableArray alloc] initWithCapacity:[entries count]];

        
    for (NSDictionary *item in entries)
    {
        NSArray *keys = [item allKeys];
          
        // values in foreach loop
        for (NSString *key in keys)
        {
            NSLog(@"%@ est associé à %@",key, [item objectForKey:key]);
        }
            
        [titles addObject:[[item objectForKey:@"title"] objectForKey:@"$t"]];
         
    }
    self.tableViewArray = titles;
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    }
 
@end