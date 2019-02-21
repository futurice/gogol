{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE NoImplicitPrelude  #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds      #-}
{-# OPTIONS_GHC -fno-warn-unused-imports    #-}

-- |
-- Module      : Network.Google.Resource.TagManager.Accounts.Containers.Workspaces.Folders.MoveEntitiesToFolder
-- Copyright   : (c) 2015-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Moves entities to a GTM Folder.
--
-- /See:/ <https://developers.google.com/tag-manager/api/v2/ Tag Manager API Reference> for @tagmanager.accounts.containers.workspaces.folders.move_entities_to_folder@.
module Network.Google.Resource.TagManager.Accounts.Containers.Workspaces.Folders.MoveEntitiesToFolder
    (
    -- * REST Resource
      AccountsContainersWorkspacesFoldersMoveEntitiesToFolderResource

    -- * Creating a Request
    , accountsContainersWorkspacesFoldersMoveEntitiesToFolder
    , AccountsContainersWorkspacesFoldersMoveEntitiesToFolder

    -- * Request Lenses
    , acwfmetfPath
    , acwfmetfTriggerId
    , acwfmetfVariableId
    , acwfmetfPayload
    , acwfmetfTagId
    ) where

import           Network.Google.Prelude
import           Network.Google.TagManager.Types

-- | A resource alias for @tagmanager.accounts.containers.workspaces.folders.move_entities_to_folder@ method which the
-- 'AccountsContainersWorkspacesFoldersMoveEntitiesToFolder' request conforms to.
type AccountsContainersWorkspacesFoldersMoveEntitiesToFolderResource
     =
     "tagmanager" :>
       "v2" :>
         CaptureMode "path" "move_entities_to_folder" Text :>
           QueryParams "triggerId" Text :>
             QueryParams "variableId" Text :>
               QueryParams "tagId" Text :>
                 QueryParam "alt" AltJSON :>
                   ReqBody '[JSON] Folder :> Post '[JSON] ()

-- | Moves entities to a GTM Folder.
--
-- /See:/ 'accountsContainersWorkspacesFoldersMoveEntitiesToFolder' smart constructor.
data AccountsContainersWorkspacesFoldersMoveEntitiesToFolder =
  AccountsContainersWorkspacesFoldersMoveEntitiesToFolder'
    { _acwfmetfPath       :: !Text
    , _acwfmetfTriggerId  :: !(Maybe [Text])
    , _acwfmetfVariableId :: !(Maybe [Text])
    , _acwfmetfPayload    :: !Folder
    , _acwfmetfTagId      :: !(Maybe [Text])
    }
  deriving (Eq, Show, Data, Typeable, Generic)


-- | Creates a value of 'AccountsContainersWorkspacesFoldersMoveEntitiesToFolder' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'acwfmetfPath'
--
-- * 'acwfmetfTriggerId'
--
-- * 'acwfmetfVariableId'
--
-- * 'acwfmetfPayload'
--
-- * 'acwfmetfTagId'
accountsContainersWorkspacesFoldersMoveEntitiesToFolder
    :: Text -- ^ 'acwfmetfPath'
    -> Folder -- ^ 'acwfmetfPayload'
    -> AccountsContainersWorkspacesFoldersMoveEntitiesToFolder
accountsContainersWorkspacesFoldersMoveEntitiesToFolder pAcwfmetfPath_ pAcwfmetfPayload_ =
  AccountsContainersWorkspacesFoldersMoveEntitiesToFolder'
    { _acwfmetfPath = pAcwfmetfPath_
    , _acwfmetfTriggerId = Nothing
    , _acwfmetfVariableId = Nothing
    , _acwfmetfPayload = pAcwfmetfPayload_
    , _acwfmetfTagId = Nothing
    }


-- | GTM Folder\'s API relative path. Example:
-- accounts\/{account_id}\/containers\/{container_id}\/workspaces\/{workspace_id}\/folders\/{folder_id}
acwfmetfPath :: Lens' AccountsContainersWorkspacesFoldersMoveEntitiesToFolder Text
acwfmetfPath
  = lens _acwfmetfPath (\ s a -> s{_acwfmetfPath = a})

-- | The triggers to be moved to the folder.
acwfmetfTriggerId :: Lens' AccountsContainersWorkspacesFoldersMoveEntitiesToFolder [Text]
acwfmetfTriggerId
  = lens _acwfmetfTriggerId
      (\ s a -> s{_acwfmetfTriggerId = a})
      . _Default
      . _Coerce

-- | The variables to be moved to the folder.
acwfmetfVariableId :: Lens' AccountsContainersWorkspacesFoldersMoveEntitiesToFolder [Text]
acwfmetfVariableId
  = lens _acwfmetfVariableId
      (\ s a -> s{_acwfmetfVariableId = a})
      . _Default
      . _Coerce

-- | Multipart request metadata.
acwfmetfPayload :: Lens' AccountsContainersWorkspacesFoldersMoveEntitiesToFolder Folder
acwfmetfPayload
  = lens _acwfmetfPayload
      (\ s a -> s{_acwfmetfPayload = a})

-- | The tags to be moved to the folder.
acwfmetfTagId :: Lens' AccountsContainersWorkspacesFoldersMoveEntitiesToFolder [Text]
acwfmetfTagId
  = lens _acwfmetfTagId
      (\ s a -> s{_acwfmetfTagId = a})
      . _Default
      . _Coerce

instance GoogleRequest
           AccountsContainersWorkspacesFoldersMoveEntitiesToFolder
         where
        type Rs
               AccountsContainersWorkspacesFoldersMoveEntitiesToFolder
             = ()
        type Scopes
               AccountsContainersWorkspacesFoldersMoveEntitiesToFolder
             =
             '["https://www.googleapis.com/auth/tagmanager.edit.containers"]
        requestClient
          AccountsContainersWorkspacesFoldersMoveEntitiesToFolder'{..}
          = go _acwfmetfPath (_acwfmetfTriggerId ^. _Default)
              (_acwfmetfVariableId ^. _Default)
              (_acwfmetfTagId ^. _Default)
              (Just AltJSON)
              _acwfmetfPayload
              tagManagerService
          where go
                  = buildClient
                      (Proxy ::
                         Proxy
                           AccountsContainersWorkspacesFoldersMoveEntitiesToFolderResource)
                      mempty
