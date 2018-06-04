//
//  MountDetailDataSource.swift
//  Habitica
//
//  Created by Phillip Thelen on 17.04.18.
//  Copyright © 2018 HabitRPG Inc. All rights reserved.
//

import Foundation
import Habitica_Models

struct MountStableItem {
    var mount: MountProtocol?
    var owned: Bool
}

class MountDetailDataSource: BaseReactiveCollectionViewDataSource<MountStableItem> {
    
    private let stableRepsository = StableRepository()
    
    init(eggType: String) {
        super.init()
        sections.append(ItemSection<MountStableItem>(title: L10n.Stable.standard))
        sections.append(ItemSection<MountStableItem>(title: L10n.Stable.premium))
        
        disposable.inner.add(stableRepsository.getOwnedMounts(query: "key CONTAINS '\(eggType)'")
            .map({ data -> [String: Bool] in
                var ownedMounts = [String: Bool]()
                data.value.forEach({ (ownedMount) in
                    ownedMounts[ownedMount.key ?? ""] = ownedMount.owned
                })
                return ownedMounts
            })
            .combineLatest(with: stableRepsository.getMounts(query: "egg == '\(eggType)'"))
            .on(value: {[weak self](ownedMounts, mounts) in
                self?.sections[0].items.removeAll()
                self?.sections[1].items.removeAll()
                mounts.value.forEach({ (mount) in
                    let item = MountStableItem(mount: mount, owned: ownedMounts[mount.key ?? ""] ?? false)
                    if mount.type == "premium" {
                        self?.sections[1].items.append(item)
                    } else {
                        self?.sections[0].items.append(item)
                    }
                })
                self?.collectionView?.reloadData()
            }).start())
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if let mountItem = item(at: indexPath), let mountCell = cell as? MountDetailCell {
            mountCell.configure(mountItem: mountItem)
        }
        
        return cell
    }
}
