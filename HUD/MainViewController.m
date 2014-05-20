//
//  MainViewController.m
//  HUD
//
//  Created by RAZA on 5/19/14.
//
//

#import "MainViewController.h"

@interface MainViewController ()

@end

CLLocationManager *locationManager;

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = .1;
    
    [locationManager startUpdatingLocation];
    
    
    // Do any additional setup after loading the view.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation*)newLocation
fromLocation:(CLLocation *)oldLocation{
    //simply get the speed provided by the phone from newLocation
    NSLog(@"CHANGED LOCATION");
    double gpsSpeed = newLocation.speed;
    NSLog(@"Speed of Device is %f",newLocation.speed);
    // alternative manual method
    if(oldLocation != nil)
    {
        CLLocationDistance distanceChange = [newLocation getDistanceFrom:oldLocation];
        NSTimeInterval sinceLastUpdate = [newLocation.timestamp
                                          timeIntervalSinceDate:oldLocation.timestamp];
        double calculatedSpeed = distanceChange / sinceLastUpdate;
        
                              
        int myInt = (int)calculatedSpeed*2.23693629;
        self.speedCalc.text = [NSString stringWithFormat:@"%d", myInt];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
