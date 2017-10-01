#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 
{
    NSArray *tableViewArray;
}
@property (weak, nonatomic) IBOutlet UITableView *_tableView;
@property (nonatomic, retain) NSArray *tableViewArray;

@end