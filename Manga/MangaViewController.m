//
//  MangaViewController.m
//  Manga
//
//  Created by Quang Huynh on 7/4/16.
//  Copyright © 2016 Quang Huynh. All rights reserved.
//

#import "MangaViewController.h"
#import "Ultils.h"
#import "MangaCell.h"

@interface MangaViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *mCollection;
@property (nonatomic, strong) NSArray *arrImg;

@end

@implementation MangaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.mCollection registerNib:[UINib nibWithNibName:@"MangaCell" bundle:nil] forCellWithReuseIdentifier:@"MangaCell"];
    
    [Ultils readFileFromZip];
    
    NSString *extraPath = [FilePath MangaCacheFileForFolder:FILENAME];
    
    _arrImg = [Ultils arrImageFromPath:extraPath];
    [self.mCollection reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
}
#pragma mark - UICollectionViewDelegate and UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arrImg.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MangaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MangaCell" forIndexPath:indexPath];
    
    cell.imgManga.image = [_arrImg objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.f;
}

@end
