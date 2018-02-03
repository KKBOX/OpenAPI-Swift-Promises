//
// KKBOXOpenAPISwiftPromises.swift
//
// Copyright (c) 2018 KKBOX Taiwan Co., Ltd. All Rights Reserved.
//

import Foundation
import Promises
import KKBOXOpenAPISwift

extension KKBOXOpenAPI {
	func commonPromiseCallback<T>(_ fulfill: @escaping (T) -> (), _ reject: @escaping Promise<T>.Reject) -> (KKAPIResult<T>) -> () {
		let callback: (KKAPIResult<T>) -> () = { result in
			switch result {
			case .error(let error):
				reject(error)
			case .success(let accessToken):
				fulfill(accessToken)
			}
		}
		return callback
	}
}

extension KKBOXOpenAPI {

	public func fetchAccessTokenByClientCredential() -> Promise<KKAccessToken> {
		return Promise<KKAccessToken>(on: DispatchQueue.main) { fulfill, reject in
			let _ = try self.fetchAccessTokenByClientCredential(callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Tracks

	public func fetch(track ID: String, territory: KKTerritory = .taiwan) -> Promise<KKTrackInfo> {
		return Promise<KKTrackInfo>(on: .main) { fulfill, reject in
			let _ = try self.fetch(track: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Albums

	public func fetch(album ID: String, territory: KKTerritory = .taiwan) -> Promise<KKAlbumInfo> {
		return Promise<KKAlbumInfo>(on: .main) { fulfill, reject in
			let _ = try self.fetch(album: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	public func fetch(tracksInAlbum ID: String, territory: KKTerritory = .taiwan) -> Promise<KKTrackList> {
		return Promise<KKTrackList>(on: .main) { fulfill, reject in
			let _ = try self.fetch(tracksInAlbum: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Artist

	public func fetch(artist ID: String, territory: KKTerritory = .taiwan) -> Promise<KKArtistInfo> {
		return Promise<KKArtistInfo>(on: .main) { fulfill, reject in
			let _ = try self.fetch(artist: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	public func fetch(albumsBelongToArtist ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 200) -> Promise<KKAlbumList> {
		return Promise<KKAlbumList>(on: .main) { fulfill, reject in
			let _ = try self.fetch(albumsBelongToArtist: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	public func fetch(topTracksOfArtist ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 200) -> Promise<KKTrackList> {
		return Promise<KKTrackList>(on: .main) { fulfill, reject in
			let _ = try self.fetch(topTracksOfArtist: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	public func fetch(relatedArtistsOfArtist ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 20) -> Promise<KKArtistList> {
		return Promise<KKArtistList>(on: .main) { fulfill, reject in
			let _ = try self.fetch(relatedArtistsOfArtist: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

extension KKBOXOpenAPI {
	//MARK: Shared Playlists

	public func fetch(playlist ID: String, territory: KKTerritory = .taiwan) -> Promise<KKPlaylistInfo> {
		return Promise<KKPlaylistInfo>(on: .main) { fulfill, reject in
			let _ = try self.fetch(playlist: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	public func fetch(tracksInPlaylist ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 20) -> Promise<KKTrackList> {
		return Promise<KKTrackList>(on: .main) { fulfill, reject in
			let _ = try self.fetch(tracksInPlaylist: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Featured Playlists

	public func fetchFeaturedPlaylists(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKPlaylistList> {
		return Promise<KKPlaylistList>(on: .main) { fulfill, reject in
			let _ = try self.fetchFeaturedPlaylists(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

extension KKBOXOpenAPI {
	//MARK: New-Hits Playlists

	public func fetchNewHitsPlaylists(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 10) -> Promise<KKPlaylistList> {
		return Promise<KKPlaylistList>(on: .main) { fulfill, reject in
			let _ = try self.fetchNewHitsPlaylists(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

extension KKBOXOpenAPI {
	//MARK: Featured Playlists Categories

	public func fetchFeaturedPlaylistCategories(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKFeaturedPlaylistCategoryList> {
		return Promise<KKFeaturedPlaylistCategoryList>(on: .main) { fulfill, reject in
			let _ = try self.fetchFeaturedPlaylistCategories(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	public func fetchFeaturedPlaylist(inCategory ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKFeaturedPlaylistCategory> {
		return Promise<KKFeaturedPlaylistCategory>(on: .main) { fulfill, reject in
			let _ = try self.fetchFeaturedPlaylist(inCategory: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Mood Radio Stations
	public func fetchMoodStations(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKRadioStationList> {
		return Promise<KKRadioStationList>(on: .main) { fulfill, reject in
			let _ = try self.fetchMoodStations(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	public func fetch(tracksInMoodStation ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKRadioStation> {
		return Promise<KKRadioStation>(on: .main) { fulfill, reject in
			let _ = try self.fetch(tracksInMoodStation: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	//MARK: Genre Radio Stations

	public func fetchGenreStations(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKRadioStationList> {
		return Promise<KKRadioStationList>(on: .main) { fulfill, reject in
			let _ = try self.fetchGenreStations(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	public func fetch(tracksInGenreStation ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKRadioStation> {
		return Promise<KKRadioStation>(on: .main) { fulfill, reject in
			let _ = try self.fetch(tracksInGenreStation: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

