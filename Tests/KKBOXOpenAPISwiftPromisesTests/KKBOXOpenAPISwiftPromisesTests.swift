import XCTest
import Promises
import KKBOXOpenAPISwift
@testable import KKBOXOpenAPISwiftPromises

class KKBOXOpenAPISwiftPromisesTests: XCTestCase {

	var API: KKBOXOpenAPI!

	override func setUp() {
		super.setUp()
		self.API = KKBOXOpenAPI(clientID: "5fd35360d795498b6ac424fc9cb38fe7", secret: "8bb68d0d1c2b483794ee1a978c9d0b5d")
	}

	//MARK: -

	func validate(track: KKTrackInfo) {
		XCTAssertNotNil(track)
		XCTAssertTrue(track.ID.count > 0)
		XCTAssertTrue(track.name.count > 0)
		XCTAssertTrue(track.duration > 0)
		XCTAssertNotNil(track.url)
		//		XCTAssertTrue(track.trackOrderInAlbum > 0)
		//		XCTAssertTrue(track.territoriesThatAvailableAt.count > 0)
		//		XCTAssertTrue(track.territoriesThatAvailableAt.contains(.taiwan))
		if let album = track.album {
			self.validate(album: album)
		}
	}

	func validate(album: KKAlbumInfo) {
		XCTAssertNotNil(album)
		XCTAssertTrue(album.ID.count > 0)
		XCTAssertTrue(album.name.count > 0)
		XCTAssertNotNil(album.url)
		XCTAssertTrue(album.images.count == 3)
		//		XCTAssertTrue(album.releaseDate?.count ?? 0 > 0)
		//		XCTAssertTrue(album.territoriesThatAvailanbleAt.count > 0, "\(album.name)")
		//		XCTAssertTrue(album.territoriesThatAvailanbleAt.contains(.taiwan))
		self.validate(artist: album.artist!)
	}

	func validate(artist: KKArtistInfo) {
		XCTAssertNotNil(artist)
		XCTAssertTrue(artist.ID.count > 0)
		XCTAssertTrue(artist.name.count > 0)
		XCTAssertNotNil(artist.url)
		XCTAssertTrue(artist.images.count == 2)
	}

	func validate(playlist: KKPlaylistInfo) {
		XCTAssertNotNil(playlist);
		XCTAssertTrue(playlist.ID.count > 0);
		XCTAssertTrue(playlist.title.count > 0);
		XCTAssertNotNil(playlist.url);
	}

	func validate(user: KKUserInfo) {
		XCTAssertTrue(user.ID.count > 0)
		XCTAssertTrue(user.name.count > 0)
		XCTAssertNotNil(user.url)
		XCTAssertNotNil(user.userDescription)
		XCTAssertTrue(user.images.count > 0)
	}

	//MARK: -

	func testFetchAccessToken() {
		let exp = self.expectation(description: "testFetchAccessToken")
		self.API.fetchAccessTokenByClientCredential().then { token in
				exp.fulfill()
			}.catch { error in
				XCTFail(error.localizedDescription)
				exp.fulfill()
			}
		self.wait(for: [exp], timeout: 3)
	}

	func testFetchWithInvalidCredential() {
		let exp = self.expectation(description: "testFetchWithInvalidCredential")
		self.API = KKBOXOpenAPI(clientID: "121321223123123", secret: "1231231321213")
		self.API.fetchAccessTokenByClientCredential().then { token in
				XCTFail("It's impossible!")
				exp.fulfill()
			}.catch { error in
				exp.fulfill()
			}
		self.wait(for: [exp], timeout: 3)
	}

	func testFetchTrack() {
		let exp = self.expectation(description: "testFetchAccessToken")
		self.API.fetchAccessTokenByClientCredential().then { token in
				return self.API.fetch(track: "4kxvr3wPWkaL9_y3o_")
			}.then { track in
				self.validate(track: track)
				exp.fulfill()
			}.catch {error in
				exp.fulfill()
			}
		self.wait(for: [exp], timeout: 3)
	}


    static var allTests = [
        ("testExample", testFetchAccessToken),
    ]
}
