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

	/// Fetch an access token by passing client credential.
	///
	/// - Returns: A promise.
	public func fetchAccessTokenByClientCredential() -> Promise<KKAccessToken> {
		return Promise<KKAccessToken>(on: DispatchQueue.main) { fulfill, reject in
			_ = try self.fetchAccessTokenByClientCredential(callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Tracks

	/// Fetch a song track by giving a song track ID.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#tracks-track_id).
	///
	/// - Parameters:
	///   - ID: ID of the track.
	///   - territory: The Territory
	/// - Returns: A promise.
	public func fetch(track ID: String, territory: KKTerritory = .taiwan) -> Promise<KKTrackInfo> {
		return Promise<KKTrackInfo>(on: .main) { fulfill, reject in
			_ = try self.fetch(track: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Albums

	/// Fetch an album by giving an album ID.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#albums-album_id).
	///
	/// - Parameters:
	///   - ID: ID of the album.
	///   - territory: The Territory.
	/// - Returns: A promise.
	public func fetch(album ID: String, territory: KKTerritory = .taiwan) -> Promise<KKAlbumInfo> {
		return Promise<KKAlbumInfo>(on: .main) { fulfill, reject in
			_ = try self.fetch(album: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch tracks contained in an album.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#albums-album_id-tracks).
	///
	/// - Parameters:
	///   - ID: ID of the album.
	///   - territory: The Territory.
	/// - Returns: A promise.
	public func fetch(tracksInAlbum ID: String, territory: KKTerritory = .taiwan) -> Promise<KKTrackList> {
		return Promise<KKTrackList>(on: .main) { fulfill, reject in
			_ = try self.fetch(tracksInAlbum: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Artist

	/// Fetch the profile by giving an artist ID.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#artists-artist_id).
	///
	/// - Parameters:
	///   - ID: ID of the artist.
	///   - territory: The Territory.
	/// - Returns: A promise.
	public func fetch(artist ID: String, territory: KKTerritory = .taiwan) -> Promise<KKArtistInfo> {
		return Promise<KKArtistInfo>(on: .main) { fulfill, reject in
			_ = try self.fetch(artist: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch albums of an artist.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#artists-artist_id-albums).
	///
	/// - Parameters:
	///   - ID: ID of the artist.
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 200 by default.
	/// - Returns: A promise.
	public func fetch(albumsBelongToArtist ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 200) -> Promise<KKAlbumList> {
		return Promise<KKAlbumList>(on: .main) { fulfill, reject in
			_ = try self.fetch(albumsBelongToArtist: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch top tracks of an artist.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#artists-artist_id-toptracks).
	///
	/// - Parameters:
	///   - ID: ID of the artist.
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 200 by default.
	/// - Returns: A promise.
	public func fetch(topTracksOfArtist ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 200) -> Promise<KKTrackList> {
		return Promise<KKTrackList>(on: .main) { fulfill, reject in
			_ = try self.fetch(topTracksOfArtist: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch related artists of an artist.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#artists-artist_id-relatedartists).
	///
	/// - Parameters:
	///   - ID: ID of the artist.
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 20 by default.
	/// - Returns: A promise.
	public func fetch(relatedArtistsOfArtist ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 20) -> Promise<KKArtistList> {
		return Promise<KKArtistList>(on: .main) { fulfill, reject in
			_ = try self.fetch(relatedArtistsOfArtist: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

extension KKBOXOpenAPI {
	//MARK: Shared Playlists

	/// Fetch a playlist's metadat and tracks by giving the playlist ID
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#sharedplaylists-playlist_id).
	///
	/// - Parameters:
	///   - ID: The playlist ID.
	///   - territory: The Territory.
	/// - Returns: A promise.
	public func fetch(playlist ID: String, territory: KKTerritory = .taiwan) -> Promise<KKPlaylistInfo> {
		return Promise<KKPlaylistInfo>(on: .main) { fulfill, reject in
			_ = try self.fetch(playlist: ID, territory: territory, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch tracks contained in a playlist.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#sharedplaylists-playlist_id-tracks).
	///
	/// - Parameters:
	///   - ID: The playlist ID.
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 20 by default.
	/// - Returns: A promise.
	public func fetch(tracksInPlaylist ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 20) -> Promise<KKTrackList> {
		return Promise<KKTrackList>(on: .main) { fulfill, reject in
			_ = try self.fetch(tracksInPlaylist: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Featured Playlists

	/// Fetch the featued playlists.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#featuredplaylists).
	///
	/// - Parameters:
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetchFeaturedPlaylists(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKPlaylistList> {
		return Promise<KKPlaylistList>(on: .main) { fulfill, reject in
			_ = try self.fetchFeaturedPlaylists(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

extension KKBOXOpenAPI {
	//MARK: New-Hits Playlists

	/// Fetch the New-Hits playlists.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#newhitsplaylists).
	///
	/// - Parameters:
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 10 by default.
	/// - Returns: A promise.
	public func fetchNewHitsPlaylists(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 10) -> Promise<KKPlaylistList> {
		return Promise<KKPlaylistList>(on: .main) { fulfill, reject in
			_ = try self.fetchNewHitsPlaylists(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

extension KKBOXOpenAPI {
	//MARK: Featured Playlists Categories

	/// Fetch featured playlist categories.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#featuredplaylistcategories-category_id).
	///
	/// - Parameters:
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetchFeaturedPlaylistCategories(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKFeaturedPlaylistCategoryList> {
		return Promise<KKFeaturedPlaylistCategoryList>(on: .main) { fulfill, reject in
			_ = try self.fetchFeaturedPlaylistCategories(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch featuerd playlists in a category.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#featuredplaylistcategories-category_id-playlists).
	///
	/// - Parameters:
	///   - ID: The category ID.
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetchFeaturedPlaylist(inCategory ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKFeaturedPlaylistCategory> {
		return Promise<KKFeaturedPlaylistCategory>(on: .main) { fulfill, reject in
			_ = try self.fetchFeaturedPlaylist(inCategory: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Mood Radio Stations

	/// Fetch mood station categories.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#moodstations).
	///
	/// - Parameters:
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetchMoodStations(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKRadioStationList> {
		return Promise<KKRadioStationList>(on: .main) { fulfill, reject in
			_ = try self.fetchMoodStations(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch tracks in a mood radio station.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#moodstations-station_id).
	///
	/// - Parameters:
	///   - ID: Mood station ID
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetch(tracksInMoodStation ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKRadioStation> {
		return Promise<KKRadioStation>(on: .main) { fulfill, reject in
			_ = try self.fetch(tracksInMoodStation: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	//MARK: Genre Radio Stations

	/// Fetch genre station categories.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#genrestations).
	///
	/// - Parameters:
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetchGenreStations(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKRadioStationList> {
		return Promise<KKRadioStationList>(on: .main) { fulfill, reject in
			_ = try self.fetchGenreStations(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch tracks in a genre radio station.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#genrestations-station_id).
	///
	/// - Parameters:
	///   - ID: Genre station ID
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetch(tracksInGenreStation ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKRadioStation> {
		return Promise<KKRadioStation>(on: .main) { fulfill, reject in
			_ = try self.fetch(tracksInGenreStation: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

extension KKBOXOpenAPI {
	//MARK: New Released Albums

	/// Fetch the categories of the new released albums.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#newreleasecategories).
	///
	/// - Parameters:
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetchNewReleaseAlbumsCategories(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKNewReleasedAlbumsCategoryList> {
		return Promise<KKNewReleasedAlbumsCategoryList>(on: .main) { fulfill, reject in
			_ = try self.fetchNewReleaseAlbumsCategories(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

	/// Fetch albums in a given new released albums category.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#newreleasecategories-category_id).
	///
	/// - Parameters:
	///   - ID: The categiry ID.
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 100 by default.
	/// - Returns: A promise.
	public func fetch(newReleasedAlbumsUnderCategory ID: String, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKNewReleasedAlbumsCategory> {
		return Promise<KKNewReleasedAlbumsCategory>(on: .main) { fulfill, reject in
			_ = try self.fetch(newReleasedAlbumsUnderCategory: ID, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}

}

extension KKBOXOpenAPI {
	//MARK: Charts

	/// Fetch charts.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#charts).
	///
	/// - Parameters:
	///   - territory: The Territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 50 by default.
	/// - Returns: A promise.
	public func fetchCharts(territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 100) -> Promise<KKPlaylistList> {
		return Promise<KKPlaylistList>(on: .main) { fulfill, reject in
			_ = try self.fetchCharts(territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}
	}
}

extension KKBOXOpenAPI {
	//MARK: Search

	/// Search in KKBOX's music library.
	///
	/// See [API reference](https://docs-en.kkbox.codes/v1.1/reference#search).
	///
	/// - Parameters:
	///   - keyword: The search keyword.
	///   - types: Artists, albums, tracks or playlists.
	///   - territory: The territory.
	///   - offset: The offset. 0 by default.
	///   - limit: The limit. 50 by default.
	public func search(with keyword: String, types: KKSearchType, territory: KKTerritory = .taiwan, offset: Int = 0, limit: Int = 50) -> Promise<KKSearchResults> {
		return Promise<KKSearchResults>(on: .main) { fulfill, reject in
			_ = try self.search(with: keyword, types: types, territory: territory, offset: offset, limit: limit, callback: self.commonPromiseCallback(fulfill, reject))
		}

	}

}
